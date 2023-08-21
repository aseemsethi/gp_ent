import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp_ent/labs/addVpc.dart';
import 'package:gp_ent/labs/awsSetup.dart';
import 'package:gp_ent/labs/lab1verify.dart';
import 'package:gp_ent/screens/learning.dart';
import 'package:gp_ent/screens/wrapper_auth.dart';
import 'package:gp_ent/screens/wrapper_home.dart';
import './screens/qChapters.dart';
import './screens/qScreen.dart';
import './screens/progress.dart';
import './screens/labs.dart';
import './services/auth.dart';
import './labs/network.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'labs/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().authStateChange(),
      initialData: null,
      child: MaterialApp(
        //home: Wrapper(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => Wrapper(),
          '/phishing': (ctx) => QChapters(),
          '/securityTest': (ctx) => QChapters(),
          '/secOps1': (ctx) => QChapters(),
          '/secOps2': (ctx) => QChapters(),
          '/questions': (ctx) => QScreen(),
          '/progress': (ctx) => Progress(),
          '/labs': (ctx) => Labs(),
          '/network': (ctx) => Network(),
          '/intro': (ctx) => Intro(),
          '/cfgkeys': (ctx) => CfgKeys(),
          '/awsSetup': (ctx) => AwsSetup(),
          '/lab1Verify': (ctx) => Lab1Verify(),
          '/learning': (ctx) => Learning(),
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
