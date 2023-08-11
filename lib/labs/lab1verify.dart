import 'package:flutter/material.dart';
import 'package:gp_ent/data/labsData.dart';
import '../services/auth.dart';
import '../widgets/securityHdgItem.dart';

class Lab1Verify extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('GP Security - Lab1 Verify'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              semanticLabel: 'logout',
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: textSection,
    );
  }
}

class lab1Data {
  String name;
  int id;

  lab1Data({required this.name, required this.id});
}

List lab1verifyStruct = [
  lab1Data(name: "Test Descr", id: 0),
  lab1Data(name: "2 EC2", id: 1),
  lab1Data(name: "Security Group", id: 2)
];

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: ListView.builder(
    itemCount: lab1verifyStruct.length,
    itemBuilder: (context, index) {
      if (index == 0) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                lab1verifyStruct[index].name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                'Verify',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }
      return Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              lab1verifyStruct[index].name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            leading: CircleAvatar(
              child: Text(
                (index).toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: TextButton(
                child: Text("Check".toUpperCase(),
                    style: const TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(10)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () => check()),
          ),
        ),
      );
    },
  ),
);

void check() {
  print("Verify clicked");
}
