import 'package:flutter/material.dart';
import '../services/auth.dart';

class AwsSetup extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('GP Security - AWS Setup'),
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
    '''
    Create an "AWS Free Tier" account at aws.amazomn.com using your favourite browser, like Chrome.
    You will be prompted to create a new AWS account on the "Sign up for AWS" page. You need to enter a root email address for this new account and an account name for this AWS account.
    You will also need to provide your credit card information to AWS. 

    For the labs in this Security Training module, the free tier shouls suffice.
    Create IAM user from the IAM console with username and password. Attach a "admin" role to this user.
    
    Select "User" and the Select "create AWS Access Key"
    Select "Application running outside AWS" - You plan to use this access key to enable an application running on an on-premises host, 
or to use a local AWS client or third-party AWS plugin.
    Create "Access Key". In the following scren, enter an optional TAG string.
    Once the "Access Key" is key, download it as a CSV file or copy it to a safe place on your laptop. Once you move away from this scren, there is no way to retreive your Access Keys. You will need to delete these and recreate them, if these are lost.

    ''',
    softWrap: true,
  ),
);
