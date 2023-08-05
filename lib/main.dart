import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp_ent/screens/wrapper_auth.dart';
import 'package:gp_ent/screens/wrapper_home.dart';
import './screens/qChapters.dart';
import './screens/qScreen.dart';
import './screens/progress.dart';
import './services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

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
          '/level1': (ctx) => QChapters(),
          '/level2': (ctx) => QChapters(),
          '/level3': (ctx) => QChapters(),
          '/questions': (ctx) => QScreen(),
          '/progress': (ctx) => Progress(),
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
