import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collector_app/homePage.dart';
import 'package:garbage_collector_app/utils/Themes.dart';

import '../../main.dart';
import '../auth_page_house.dart';

class LoginHouse extends StatefulWidget {
  final VoidCallback onClickedSignUpHouse;
  const LoginHouse({
    Key? key,
    required this.onClickedSignUpHouse,
  }) : super(key: key);

  @override
  State<LoginHouse> createState() => _LoginHouseState();
}

class _LoginHouseState extends State<LoginHouse> {
  //Initializing firebase app

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  //Login fucntion

  // static Future<User?> loginUsingPhonePassword(
  //     {required num phone,
  //     required String password,
  //     required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   User? user;

  //   try {
  //     UserCredential userCredential =
  //         await auth.signInWithCredential (phoneNumber: phone);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       print("No user found");
  //     }
  //   }
  //   return user;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //this will deal with keyboard overflowing
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 169, 237, 225),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("désolé, une erreur s'est produite"),
              );
            } else if (snapshot.hasData) {
              return Home();
            } else {
              return Column(
                children: [
                  const LoginScreenDesign(),
                  const SizedBox(
                    height: 0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                        text: "Je n'ai pas de compte!\t\t\t\t",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUpHouse,
                            text: "S'enregistrer",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: PRIMARY_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class LoginScreenDesign extends StatefulWidget {
  //final VoidCallback onRegister;
  const LoginScreenDesign({Key? key}) : super(key: key);

  @override
  State<LoginScreenDesign> createState() => _LoginScreenDesignState();
}

class _LoginScreenDesignState extends State<LoginScreenDesign> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode focusNodeEmail;
  late FocusNode focusNodePassword;

  bool passenable = true; //boolean value to track password view enable disable.
  @override
  void initState() {
    super.initState();

    focusNodeEmail = FocusNode();
    focusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeEmail.dispose();
    focusNodePassword.dispose();

    super.dispose();
  }

  Future _signIn() async {
    /*  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Column(
        children: const [
          Text("data"),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    ); */
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      AlertDialog(
        content: Column(
          children: [
            Text(
              "Désolé, impossible de se connecter au Serveur!\n MESSAGE D'ERREUR: $e",
            ),
          ],
        ),
      );
      //removing the dialog when data can be fetched in firebase
      //  navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.06,
      ),
      child: ListView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.06,
        ),
        shrinkWrap:
            true, //when the listView doesn't have many elements, use a shrinkwrap to let it occupy only the size of its children
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Collector',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Connectez Vous!',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 44),
              //phone number

              TextField(
                autofocus: false,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "Votre Email ici",
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'email',
                  suffixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                  _signIn();
                },
                autofocus: false,
                focusNode: focusNodePassword,
                obscureText:
                    passenable, //if passenable == true, show **, else show password character
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  hintText: "Votre mot de passe ici",
                  fillColor: Colors.black,
                  labelText: "Mot de passe",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      //add Icon button at end of TextField
                      setState(() {
                        //refresh UI
                        if (passenable) {
                          //if passenable == true, make it false
                          passenable = false;
                        } else {
                          passenable =
                              true; //if passenable == false, make it true
                        }
                      });
                    },
                    icon: Icon(
                      passenable == true
                          ? Icons.remove_red_eye
                          : Icons.password,
                      color: Colors.blue,
                    ),
                  ),
                  //eye icon if passenable = true, else, Icon is ***__
                ),
              ),

              //password field

              TextButton(
                child: const Text("J'ai oublié mon mot de passe"),
                onPressed: () => {},
              ),
              const SizedBox(
                height: 10,
                //width: 150,
              ),

              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: PRIMARY_COLOR,
                  onPressed: _signIn,
                  elevation: 1,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Text(
                    'Se connecter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          /* Visibility(
            visible: false,
            child: Align(
              alignment: Alignment.center,
              child: Text("Text not shown, just to have the listView have more elements to render/ Not just a column")
            ),
          )  */
        ],
      ),
    );
  }
}
