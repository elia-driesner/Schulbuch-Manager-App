import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'firebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../not_used_code/registerSelectionPage.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'changePassword.dart';

import '../config/palette.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? signInStatusMessage = '';
  bool isHidden = true;

  void sign_in({required String email, required String password}) async {
    if (email == '') {
      signInStatusMessage = 'Bitte Email Adresse eingeben';
    } else if (password.length <= 5) {
      signInStatusMessage = 'Password min. 6 Zeichen';
    } else {
      var user = Auth(email: email, password: password);
      signInStatusMessage = await user.signIn();
      while (signInStatusMessage == '') {
        await Future.delayed(const Duration(seconds: 1));
        signInStatusMessage = await user.signIn();
      }
      setState(() {
        signInStatusMessage;
      });

      await Future.delayed(const Duration(seconds: 1));
      final _user = await FirebaseAuth.instance.currentUser;
      await Future.delayed(const Duration(seconds: 1));
      if (signInStatusMessage == 'Ladet...' && _user != null) {
        await FirebaseFirestore.instance
            .collection('Accounts')
            .doc(_user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            if (documentSnapshot['accountActive'] == false) {
              DocumentReference userRef = FirebaseFirestore.instance
                  .collection('Accounts')
                  .doc(_user.uid);

              userRef
                  .set(
                    {'accountActive': true},
                    SetOptions(merge: true),
                  )
                  .then((value) => {})
                  .catchError((error) => print("Failed to add user: $error"));
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      changePassword(oldPasswordSug: password),
                ),
                (Route<dynamic> route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => App(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          }
        });
      }
    }
    setState(() {
      signInStatusMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 1000,
        color: WHITE,
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * .15, 0, 0),
                    child: Column(
                      children: [
                        Container(
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/1160/1160358.png',
                                height: sHeigth * .28,
                                width: sWidth * .28)),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  0, sHeigth * .00, 0, sHeigth * .04),
                              child: Text('Anmelden',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0,
                                      fontSize: 35,
                                      color: BLACK)),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(
                              sWidth * .06, 0, sWidth * .06, 0),
                          color: Color(0xFF18191F).withOpacity(0),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            child: Column(children: [
                              Card(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: BLACK, width: 2),
                                ),
                                color: WHITE,
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextField(
                                      controller: emailController
                                      // ..text = 'elia.driesner@gmail.com'
                                      ,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Email',
                                          prefixIcon:
                                              Icon(Icons.email_outlined),
                                          labelStyle: TextStyle(color: BLACK)),
                                      style:
                                          TextStyle(color: BLACK, height: 1)),
                                ),
                              ),
                              Card(
                                shadowColor: Color.fromARGB(0, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: BLACK, width: 2),
                                ),
                                color: WHITE,
                                margin: EdgeInsets.fromLTRB(
                                    0, sHeigth * 0.035, 0, 0),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextField(
                                      controller: passwordController
                                      // ..text = '111112'
                                      ,
                                      obscureText: isHidden,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: isHidden
                                                ? Icon(Icons
                                                    .visibility_off_outlined)
                                                : Icon(
                                                    Icons.visibility_outlined),
                                            onPressed: () => {
                                              setState(
                                                  () => {isHidden = !isHidden})
                                            },
                                          ),
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.lock_outlined),
                                          labelText: 'Password',
                                          labelStyle: TextStyle(color: BLACK)),
                                      style:
                                          TextStyle(color: BLACK, height: 1)),
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        sWidth * .06, sHeigth * .055, sWidth * .06, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(offset: Offset(4, 5), color: BLACK)
                          ], borderRadius: BorderRadius.circular(15)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(500, 50),
                              primary: ACCENT,
                              shadowColor: BLACK,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              side: BorderSide(width: 2, color: BLACK),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text('Anmelden',
                                      style: TextStyle(color: BLACK)),
                                ),
                                Icon(Icons.arrow_forward, color: BLACK)
                              ],
                            ),
                            onPressed: () => sign_in(
                                email: emailController.text,
                                password: passwordController.text),
                          ),
                        ),
                        Align(
                            child: Column(children: [
                          if (signInStatusMessage == 'Ladet...')
                            Container()
                          else
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                              child: Text(signInStatusMessage.toString(),
                                  style: const TextStyle(
                                      color: BLACK, fontSize: 14)),
                            ),
                        ]))
                      ],
                    )),
                if (signInStatusMessage == 'Ladet...')
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height * .05, 0, 0),
                      child: const CupertinoActivityIndicator(radius: 18),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ));
    ;
  }
}
