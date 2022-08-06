import 'dart:async';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth/registerPage.dart';
import 'auth/registerSelectionPage.dart';
import 'auth/signSelectPage.dart';

import 'homepage/studentHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: App()));
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _user;

  late Timer timer;

  void getUser() async {
    _user = await FirebaseAuth.instance.currentUser;

    setState(() {
      if (_user != null) {
        debugPrint(_user.email);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => signSelectPage()),
        );
      }
    });
  }

  void signUserOut() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => signSelectPage()),
    );
  }

  @override
  void initState() {
    getUser();
    timer = Timer.periodic(Duration(seconds: 500), (Timer t) => getUser());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          _user != null ? studentHomepage() : Container(),
        ],
      ),
    ));
  }
}
