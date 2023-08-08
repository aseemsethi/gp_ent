import 'package:flutter/material.dart';
import 'package:gp_ent/data/labsData.dart';
import '../services/auth.dart';
import '../widgets/securityHdgItem.dart';

class Intro extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('GP Security - Intro'),
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
        body: ListView(
          children: [
            Image.asset(
              'assets/images/one.jpeg',
              width: 600,
              height: 100,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
          ],
        ));
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Introduction to Lab Work',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '... in AWS',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.timeline,
        color: Colors.red[500],
      ),
      const Text('10 min'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    '''Information Security programs are build around 3 objectives, commonly known as CIA - Confidentiality, Integrity, Availability. '
    
    Confidentiality - information is not disclosed to unauthorized individuals, entities and process. 

    Integrity - maintaining accuracy and completeness of data. 

    Availability - information must be available when needed. Denial-of-Service attack impacts Availability, as one example of an attack on this security objective.

    There are a few more critical objectives that we would like Information Security program to achieve - 
    Compliance: Meeting regulatory and legal requirements, such as those related to data privacy and protection.
    Risk management: Identifying and mitigating potential security threats to prevent harm to the organization.
    Disaster recovery: Developing and implementing a plan to recover from data loss or system failures.
    
    We will walk through a series of lab excercises that you would be executing an nodes in an AWS account, that will help us achieve some of the above gaols. 
    
    After every excercise, the lab will check whether the excercise was done correctly. For this, the app user is requested to enter Access Keys, as described in the following tutorial, for the app to connect using AWS APIs and confirm the results of the lab.

    ''',
    softWrap: true,
  ),
);
