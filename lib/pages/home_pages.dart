import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
        ],
      ),
    );
  }
}
