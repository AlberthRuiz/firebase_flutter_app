import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebaseappc2/constants/constants.dart';
import 'package:firebaseappc2/pages/home_pages.dart';
import 'package:firebaseappc2/pages/maps_page.dart';
import 'package:firebaseappc2/pages/stream_page.dart';
import 'package:firebaseappc2/utils/tab_map.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) {
            _activeIndex = value;
            setState(() {});
          },
          items: [
            Icon(Icons.home),
            Icon(Icons.location_on),
            Icon(Icons.stream)
          ]),
      appBar: AppBar(
        title: Text(
          "Tab Page",
          style: titleStyle,
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: pageDetails[_activeIndex]["pageName"],
    );
  }
}
