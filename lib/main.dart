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
import 'homepage/widgets/sideMenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF494087),
        ),
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sideMenu(),
        body: Container(
          child: Column(
            children: [
              _user != null ? studentHomepage() : Container(),
            ],
          ),
        ));
  }
}
