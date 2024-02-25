import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseappc2/constants/constants.dart';
import 'package:firebaseappc2/pages/login_page.dart';
import 'package:firebaseappc2/widgets/field_forms_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String mapErrorAuth(String errorMessage) {
    if (errorMessage.contains("email-already-in-use")) {
      return "La direccion de correo ya esta en uso";
    } else if (errorMessage.contains("invalid-email")) {
      return "La direccion no es valida";
    } else if (errorMessage.contains("weak-password")) {
      return "La password no cumple con lo minimo de seguridad";
    }
    return "Ocurrio un error en creacion de cuenta";
  }

  Future<void> createAccount(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: correoController.text,
        password: contrasenaController.text,
      );
      print(userCredential.user);
      // return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            mapErrorAuth(e.toString()),
          ),
        ),
      );
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF012F3D),
                Color(0xFF0A4F64),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("App de votaciones", style: titleStyle),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  "https://talestin.com/wp-content/uploads/2023/03/Facebook-logo-blue-circle-large-transparent-png.png",
                  width: MediaQuery.of(context).size.width / 3,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Crear una cuenta",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      FieldFormWidget(
                          text: "Ingresa el correo",
                          controller: correoController),
                      FieldFormWidget(
                          text: "Ingresa la contraseña",
                          controller: contrasenaController),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                    text: TextSpan(
                  text: "Si ya tienes una cuenta ",
                  children: [
                    TextSpan(
                      text: "Inicia Sesion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                    ),
                  ],
                )),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    createAccount(context);
                  },
                  child: Text("Crear Cuenta"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
