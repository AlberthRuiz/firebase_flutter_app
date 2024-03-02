import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseappc2/constants/constants.dart';
import 'package:firebaseappc2/widgets/candidate_card.dart';
import 'package:flutter/material.dart';

class CandidatePage extends StatefulWidget {
  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  void refreshVote() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Candidate Page",
          style: titleStyle,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: candidateReference.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot candidateCollection = snapshot.data;
            List<QueryDocumentSnapshot> docs = candidateCollection.docs;
            print(docs.length.toString());
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return CandidateCard(
                    refesh: refreshVote,
                    docKey: docs[index].id,
                    image: docs[index]["image"],
                    partido: docs[index]["partidoPolitico"],
                    candidato: docs[index]["nombreCandidato"],
                    votos: docs[index]["nvotos"]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
