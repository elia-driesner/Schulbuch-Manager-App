import 'dart:async';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth/registerPage.dart';
import 'auth/registerSelectionPage.dart';
import 'auth/signSelectPage.dart';
import 'auth/signInPage.dart';
import 'auth/changePassword.dart';

import 'homepage/studentHome.dart';
import 'homepage/widgets/sideMenu.dart';

import 'userData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 46, 43, 59),
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

    if (_user != null) {
      await FirebaseFirestore.instance
          .collection('Accounts')
          .doc(_user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userDataVar = {
            'email': documentSnapshot['email'],
            'name': documentSnapshot['name'],
            'role': documentSnapshot['role']
          };
          // if (documentSnapshot['accountActive'] == false) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => changePassword()),
          //   );
          // }
        }
      });
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => signInPage(),
          transitionDuration: Duration.zero,
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  void signUserOut() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => signInPage(),
        transitionDuration: Duration.zero,
      ),
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
        resizeToAvoidBottomInset: false,
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
