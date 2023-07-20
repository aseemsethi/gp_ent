import 'package:flutter/material.dart';
import '../services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('GP Enterprise'),
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
      body: Text("Hi"),
    );
  }
}
