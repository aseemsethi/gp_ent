import 'dart:io' show Platform;
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/vpcModel.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:provider/provider.dart';
import '../shared/dbHelper.dart';

class CfgKeys extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CfgKeysState();
  }
}

class _CfgKeysState extends State<CfgKeys> {
  TextEditingController vpcName = TextEditingController(text: 'AWS-1');
  TextEditingController cloudName = TextEditingController(text: 'AWS');
  TextEditingController accessKeyId = TextEditingController(text: ''); //DRA
  TextEditingController secretAccessKey = TextEditingController(text: ''); //DRA

  TextEditingController region = TextEditingController(text: 'ap-south-1');

  //late AppState currentAppState;
  DatabaseHelper? dbHelper;

  @override
  Widget build(BuildContext context) {
    //currentAppState = context.watch<AppState>();
    //dbHelper = context.watch<DatabaseHelper>();
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;
    // print(arguments['vpcName']);

    // if (arguments['vpcName'] != "new") {
    //   _fetchVpc(arguments['vpcName']);
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("GP Security - Config Keys"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Configuration Params',
                style: TextStyle(
                    color: Colors.blue,
                    //fontWeight: FontWeight.w500,
                    fontSize: 14),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: vpcName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'VPC Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              obscureText: false,
              controller: cloudName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cloud Entity',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: accessKeyId,
              toolbarOptions: ToolbarOptions(
                paste: true,
                cut: true,
                copy: true,
                selectAll: true,
              ),
              readOnly: false,
              focusNode: FocusNode(),
              cursorColor: Colors.blue,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              autocorrect: false,
              autofocus: false,
              enableInteractiveSelection: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'AccessKeyId',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: secretAccessKey,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'SecretAccessKey',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: region,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Region',
              ),
            ),
          ),
          Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              _update();
                              //currentAppState.setReceivedText("modified");
                              FocusManager.instance.primaryFocus?.unfocus();
                              final snackBar = SnackBar(
                                content: const Text('Network Saved'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Background color
                            ),
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                    //const Spacer(flex: 1),
                    SizedBox(width: 8),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        _show();
                        _fetchVpc();
                        final snackBar = SnackBar(
                          content: const Text('Network Deleted'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: Text(
                        "Show",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    )),
                  ])),
        ],
      ),
    );
  }

  //The _update is what we will use since it update an existing DB row.
  void _update() async {
    final dbHelper = DatabaseHelper.instance;
    int id = 0;
    final row = DBModel(
        vpcName: vpcName.text,
        cloudName: cloudName.text,
        accessKeyId: accessKeyId.text,
        secretAccessKey: secretAccessKey.text,
        region: region.text);
    id = await dbHelper.updateVpc(row);
    final allRows = await dbHelper.queryAllRows();
    allRows.forEach(print);
  }

  void _fetchDB() async {
    final dbHelper = DatabaseHelper.instance;
    final allRows = await dbHelper.queryAllRows();
    allRows.forEach(print);
  }

  void _show() async {
    print("_fetchDBAll");
    final dbH = DatabaseHelper.instance;
    var rows = await dbH.fetchDB();
    print(
      '''Access Key: ${rows[0].accessKeyId.toString()}, 
      Secret: ${rows[0].secretAccessKey.toString()}''',
    );
  }

  void _fetchVpc() async {
    final dbH = DatabaseHelper.instance;
    var rows = await dbH.fetchDB();
    //DBModel dbM = await dbHelper.getVpc(name);
    vpcName.text = rows[0].vpcName.toString();
    cloudName.text = rows[0].cloudName.toString();
    accessKeyId.text = rows[0].accessKeyId.toString();
    secretAccessKey.text = rows[0].secretAccessKey.toString();
    region.text = rows[0].region.toString();
  }

  // void _insert() async {
  //   final dbHelper = DatabaseHelper.instance;
  //   int id = 0;
  //   Map<String, dynamic> row = {'vpcName': 'GCP-1', "cloudName": 'GCP'};
  //   id = await dbHelper.insertVpc(row);
  //   if (id == 99) {
  //     print('DB: insertion failure - primary key error');
  //   } else {
  //     print('DB: inserted row id: $id');
  //   }
  //   final allRows = await dbHelper.queryAllRows();
  //   allRows.forEach(print);
  // }
}
