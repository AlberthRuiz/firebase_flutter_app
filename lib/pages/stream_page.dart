import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  Color backgroundColor;
  StreamPage({required this.backgroundColor});
  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  CollectionReference productsReference =
      FirebaseFirestore.instance.collection("products");

  StreamController<String> myStreamController = StreamController();

  StreamController<int> myIntStreamController = StreamController.broadcast();

  int myCounter = 0;

  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(
        Duration(seconds: 2),
      );
    }
  }

  Future<int> getNumber() async {
    return Future.delayed(Duration(seconds: 3), () {
      return 10;
    });
  }

  @override
  void dispose() {
    myStreamController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("Init strem");
    // Stream<int> myStream = Stream.fromFuture(getNumber());
    // print("Stream creado");

    /////////////////INIT STREAM CONTROLLER 1
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (!myStreamController.isClosed) {
        myStreamController.add('Nuevo evento: ${DateTime.now()}');
      }
    });
    myStreamController.stream.listen((value) {
      print("Valor del Stream");
      print(value);
    }, onDone: () {
      print("FINALIZADO");
    }, onError: (error) {
      print("ERRRRORRRRR");
    });

    Future.delayed(Duration(seconds: 30), () {
      myStreamController.close();
    });
    /////////////////FINISH STREAM CONTROLLER 1

    // //OBTENCIÓN DE VALOR EN FUTURE
    // getNumber().then((value) {
    //   print(value);
    // });
    // //OBTENCIÓN DE VALOR EN STREAM
    // counter().listen(
    //   (event) {
    //     print(event);
    //   },
    // );
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Stream Page"),
      // ),
      backgroundColor: widget.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myIntStreamController.add(myCounter);
          myCounter++;
        },
        child: Text("Emitir"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: myIntStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "STREAM1-W1: ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 40),
                  );
                }
                return Text(
                  "0",
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            StreamBuilder(
              stream: myIntStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "STREAM1-W2: ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 40),
                  );
                }
                return Text(
                  "0",
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
          ],
        ),
      ),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection("products").snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               DocumentSnapshot doc = snapshot.data!.docs[index];
      //               return Container(
      //                 alignment: Alignment.center,
      //                 height: 30,
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     color: Colors.blueAccent),
      //                 child: Text(doc["name"]),
      //               );
      //             });
      //       } else {
      //         return Text("No data");
      //       }
      //     }),
      // STREAM BUILDER
      // body: StreamBuilder(
      //   stream: counter(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return Center(
      //         child: Text(
      //           snapshot.data.toString(),
      //           style: TextStyle(fontSize: 40),
      //         ),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
      //FUTURE BUILDER
      // body: FutureBuilder(
      //   future: getNumber(),
      //   builder: (BuildContext context, AsyncSnapshot snap) {
      //     if (snap.hasData) {
      //       return Center(
      //         child: Text(
      //           snap.data.toString(),
      //           style: TextStyle(fontSize: 40),
      //         ),
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
