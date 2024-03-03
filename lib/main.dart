import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseappc2/firebase_options.dart';
import 'package:firebaseappc2/pages/candidate_page.dart';
import 'package:firebaseappc2/pages/create_account_page.dart';
import 'package:firebaseappc2/pages/home_pages.dart';
import 'package:firebaseappc2/pages/maps2_page_custom.dart';
import 'package:firebaseappc2/pages/maps_page.dart';
import 'package:firebaseappc2/pages/stream_page.dart';
import 'package:firebaseappc2/pages/tab_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Map2Page(),
    debugShowCheckedModeBanner: false,
  ));
}
