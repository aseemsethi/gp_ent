import 'package:flutter/material.dart';
import 'package:gp_ent/data/labsData.dart';
import '../services/auth.dart';
import '../widgets/securityHdgItem.dart';

class Labs extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('GP Security - Labs'),
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
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: labsMenu
            .map((mdata) => SecurityHdgItem(
                  mdata.id,
                  mdata.title,
                  mdata.color,
                ))
            .toList(),
      ),
    );
  }
}
