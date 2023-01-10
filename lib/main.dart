import 'dart:async';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'not_used_code/registerPage.dart';
import 'not_used_code/registerSelectionPage.dart';
import 'not_used_code/signSelectPage.dart';
import 'auth/signInPage.dart';
import 'auth/changePassword.dart';

import 'pages/homepage/studentHome.dart';
import 'pages/homepage/widgets/sideMenu.dart';
import 'pages/homepage/teacherHomepage.dart';

import 'user_data_cache.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/classPages/classBook/getBooks.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF18191F),
          ),
        ),
        home: App()));
  });
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _user;

  var page;

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
          if (documentSnapshot['role'] == 'Schüler' ||
              documentSnapshot['role'] == 'Klassensprecher') {
            userDataVar = {
              'uid': _user.uid,
              'class': documentSnapshot['class'],
              'school': documentSnapshot['school'],
              'books': documentSnapshot['books'],
              'email': documentSnapshot['email'],
              'name': documentSnapshot['name'],
              'role': documentSnapshot['role']
            };
          } else if (documentSnapshot['role'] == 'Lehrer') {
            userDataVar = {
              'id': _user.uid,
              'school': documentSnapshot['school'],
              'email': documentSnapshot['email'],
              'name': documentSnapshot['name'],
              'role': documentSnapshot['role']
            };
          }

          setState(() => {
                if (documentSnapshot['role'] == 'Schüler')
                  {page = studentHomepage()}
                else if (documentSnapshot['role'] == 'Lehrer')
                  {page = teacherHomepage()}
              });
          // getBooks();
        }
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const signInPage(),
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
        pageBuilder: (context, animation1, animation2) => const signInPage(),
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  void initState() {
    getUser();
    selectedUserData = userDataVar;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void reloadApp() {
    setState(() => {page = page});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: sideMenu(),
        body: Container(
          child: Column(
            children: [
              if (page != null) page,
            ],
          ),
        ));
  }
}
