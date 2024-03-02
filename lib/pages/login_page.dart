// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseappc2/constants/constants.dart';
import 'package:firebaseappc2/pages/home_pages.dart';
import 'package:firebaseappc2/services/auth_service.dart';
import 'package:firebaseappc2/widgets/field_forms_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String mapErrorAuth(String erroMessage) {
    if (erroMessage.contains('user-not-found')) {
      return "El usuario no existe";
    } else if (erroMessage.contains("invalid-credential")) {
      return "El correo no es válido";
    } else if (erroMessage.contains("wrong-password")) {
      return "Contraseña incorrecta";
    } else {
      return "Ocurrió un error al iniciar sesión";
    }
  }

  Future<void> loginAccount(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: correoController.text,
        password: contrasenaController.text,
      );
      print(userCredential.user);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text("Ya inició sesión"),
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      // return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            mapErrorAuth(e.toString()),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
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
                  "Inicia sesión",
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
                SizedBox(height: 8),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("O inicia sesion con "),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red,
                          ),
                        ),
                        onPressed: () {
                          AuthService().signInWithGoogle();
                        },
                        color: Colors.white,
                        icon: Icon(
                          Icons.g_mobiledata,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    loginAccount(context);
                  },
                  child: Text("Iniciar sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
