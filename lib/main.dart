import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseappc2/firebase_options.dart';
import 'package:firebaseappc2/pages/create_account_page.dart';
import 'package:firebaseappc2/pages/home_pages.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: CreateAccountPage(),
    debugShowCheckedModeBanner: false,
  ));
}
