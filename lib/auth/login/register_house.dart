import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../homePage.dart';
import '../../utils/Themes.dart';
import 'login_house.dart';

class RegisterHouse extends StatefulWidget {
  const RegisterHouse({
    Key? key,
    required this.onClickedSignInHouse,
  }) : super(key: key);
  final Function() onClickedSignInHouse;
  @override
  State<RegisterHouse> createState() => _RegisterHouseState();
}

class _RegisterHouseState extends State<RegisterHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    const RegisterScreenDesign(),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          text: "J'ai déjà un compte'!\t\t\t\t",
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignInHouse,
                              text: "Se connecter",
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
            }),
      ),
    );
  }
}

class RegisterScreenDesign extends StatefulWidget {
  //final VoidCallback onRegister;
  const RegisterScreenDesign({Key? key}) : super(key: key);

  @override
  State<RegisterScreenDesign> createState() => _RegisterScreenDesignState();
}

class _RegisterScreenDesignState extends State<RegisterScreenDesign> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final localisationController = TextEditingController();

  late FocusNode focusNodeEmail;
  late FocusNode focusNodePassword;
  late FocusNode focusNodeName;
  late FocusNode focusNodePhone;
  late FocusNode focusNodeLocalisation;

  bool passenable = true; //boolean value to track password view enable disable.
  @override
  void initState() {
    super.initState();

    focusNodeEmail = FocusNode();
    focusNodePassword = FocusNode();
    focusNodeLocalisation = FocusNode();
    focusNodeName = FocusNode();
    focusNodePhone = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeLocalisation.dispose();
    focusNodeName.dispose();
    focusNodePhone.dispose();
    super.dispose();
  }

  Future _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.height * 0.06,
        right: MediaQuery.of(context).size.height * 0.06,
      ),
      child: ListView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.07,
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
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enregistrez Vous!',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 44),
              //phone number

        
              TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,

                autofocus: false,
                focusNode: focusNodeName,
                //if passenable == true, show **, else show password character
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  hintText: "\tVotre nom ici",
                  fillColor: Colors.black,
                  labelText: "\tNom",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: Icon(
                    Icons.account_box,
                  ),
                  //eye icon if passenable = true, else, Icon is ***__
                ),
              ),
              const SizedBox(height: 10),
              //
              TextField(
                autofocus: false,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "\tVotre Email ici",
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: '\tEmail',
                  suffixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  _signUp();
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
                  hintText: "\tVotre mot de passe ici",
                  fillColor: Colors.black,
                  labelText: "\tMot de passe",
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

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: PRIMARY_COLOR,
                  onPressed: _signUp,
                  elevation: 1,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Text(
                    "S'enregistrer!",
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

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
