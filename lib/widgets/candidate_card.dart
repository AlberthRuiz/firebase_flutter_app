import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CandidateCard extends StatefulWidget {
  String image;
  String partido;
  String candidato;
  int votos;
  String docKey;
  final Function refesh;

  CandidateCard({
    required this.image,
    required this.partido,
    required this.candidato,
    required this.votos,
    required this.docKey,
    required this.refesh,
  });

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await candidateReference.doc(widget.docKey).update(
          {"nvotos": widget.votos + 1},
        );
        widget.refesh;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(12),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.image,
                ),
                radius: 30,
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.partido,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                    Text(
                      widget.candidato,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Text(
                widget.votos.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
