import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScoreList {
  final String course;
  final int marks;

  ScoreList(this.course, this.marks);
}

Widget projectWidget() {
  return FutureBuilder(
    builder: (context, op) {
      if (op.connectionState == ConnectionState.none || !op.hasData) {
        //print('project snapshot data is: ${projectSnap.data}');
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: op.data.length,
        itemBuilder: (context, index) {
          List<MapEntry> myData = op.data;
          print("Index called - $index, totalLen = ${op.data.length}");
          return ListTile(
            title: Text(
              '${myData[index].key} ${(index + 1)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: CircleAvatar(
              backgroundColor: const Color(0xff764abc),
              child: Text('${myData[index].value}'),
            ),
            leading: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    },
    future: getProgressDoc(),
  );
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Report"!),
      ),
      body: projectWidget(),
    );
  }
}

Future getProgressDoc() async {
  var ll = [];

  print("getProgressDoc: called");
  Map<String, dynamic> score = {};
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final docSnapshot = await FirebaseFirestore.instance
      .collection('emp')
      .doc(_auth.currentUser!.uid)
      .get();
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data()!;
    score = data['score'];
    print('Document - $data');
    print('Scores - $score, len: ${score.length}');
    ll = score.entries.toList();
    print('$ll');
  }
  print("retuning from getProgressDoc");
  return ll;
}
