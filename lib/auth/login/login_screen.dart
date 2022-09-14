import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collector_app/homePage.dart';
import 'package:garbage_collector_app/utils/Themes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const LoginScreenDesign();
            }
            return const Center(
              child: CircularProgressIndicator(
                color: PRIMARY_COLOR,
              ),
            );
          }),
    );
  }
}

class LoginScreenDesign extends StatefulWidget {
  const LoginScreenDesign({Key? key}) : super(key: key);

  @override
  State<LoginScreenDesign> createState() => _LoginScreenDesignState();
}

class _LoginScreenDesignState extends State<LoginScreenDesign> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  late FocusNode FocusNodePhone;
  late FocusNode FocusNodePassword;

  bool passenable = true; //boolean value to track password view enable disable.
  @override
  void initState() {
    super.initState();

    FocusNodePhone = FocusNode();
    FocusNodePassword = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    FocusNodePhone.dispose();
    FocusNodePassword.dispose();

    super.dispose();
  }

  void _onConnect() {
    if (phoneController.text == '670754483' &&
        passwordController.text == 'Motdepasse') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return const Home();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'Informations incorrects!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
          content: Text(
            "S'il vous, entrez des informations correctes !!!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        30,
      ),
      child: Column(
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

          IntlPhoneField(
            controller: phoneController,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(FocusNodePassword);
            },
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.disabled,
            autofocus: false,
            style: const TextStyle(
              color: Colors.black,
            ),
            focusNode: FocusNodePhone,
            decoration: const InputDecoration(
              // hintText: 'Numéro de Téléphone',
              labelText: 'Numéro de Téléphone',
              focusColor: PRIMARY_COLOR,
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'CM',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              _onConnect();
            },
            autofocus: false,
            focusNode: FocusNodePassword,
            textAlign: TextAlign.center,
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
                    icon: Icon(passenable == true
                        ? Icons.remove_red_eye
                        : Icons.password))
                //eye icon if passenable = true, else, Icon is ***__
                ),
          ),

          //password field

          TextButton(
            child: const Text("J'ai oublié mon mot de passe"),
            onPressed: () => {},
          ),
          const SizedBox(
            height: 70,
            //width: 150,
          ),

          Container(
            width: double.infinity,
            child: RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              fillColor: PRIMARY_COLOR,
              onPressed: _onConnect,
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
    );
  }
}
