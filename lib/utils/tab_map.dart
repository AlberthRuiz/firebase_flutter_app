import 'package:firebaseappc2/pages/home_pages.dart';
import 'package:firebaseappc2/pages/maps_page.dart';
import 'package:firebaseappc2/pages/stream_page.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    "pageName": HomePage(
      backgroundColor: Color(0xff344e41),
    ),
    "title": "Home",
    "botton_color": Color(0xff344e41),
    "navvigationBarColor": Color(0xff344e41),
  },
  {
    "pageName": MapsPage(
      backgroundColor: Color(0xff3a5a40),
    ),
    "title": "Home",
    "botton_color": Color(0xff3a5a40),
    "navvigationBarColor": Color(0xff3a5a40),
  },
  {
    "pageName": StreamPage(
      backgroundColor: Color(0xff588157),
    ),
    "title": "Home",
    "botton_color": Color(0xff588157),
    "navvigationBarColor": Color(0xff588157),
  },
];
