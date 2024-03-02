import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseappc2/pages/stream_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Color backgroundColor;
  HomePage({required this.backgroundColor});
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                productReference.get().then((value) {
                  value.docs.forEach(
                    (element) {
                      print(element.data());
                    },
                  );
                });
              },
              child: Text("Get data"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StreamPage(backgroundColor: Colors.white),
                  ),
                );
              },
              child: Text("go to Stream Page"),
            )
          ],
        ),
      ),
    );
  }
}
