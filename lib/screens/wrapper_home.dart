import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../data/securityHdg.dart';
import '../widgets/securityHdgItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('GP Security'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              semanticLabel: 'logout',
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: TopHomeMenu.map((mdata) => SecurityHdgItem(
              mdata.id,
              mdata.title,
              mdata.color,
            )).toList(),
      ),
    );
  }
}
