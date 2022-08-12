import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'firebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'registerSelectionPage.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'changePassword.dart';

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
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 1000,
        color: Color(0xFFECEBE7),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 60, 0, 15),
                              child: Text('Anmelden',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0,
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 46, 43, 59))),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
                          color: Color(0xFFE5613A).withOpacity(0),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: 260,
                            child: Column(children: [
                              Card(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 190, 194, 189),
                                  ),
                                ),
                                color: Color(0xFFE8E8E6),
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextField(
                                      controller: emailController
                                        ..text = 'elia.driesner@gmail.com',
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Email',
                                          prefixIcon: Icon(Icons.email),
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 46, 43, 59))),
                                      style: TextStyle(
                                          color: Color(0xFF494087), height: 1)),
                                ),
                              ),
                              Card(
                                shadowColor: Color.fromARGB(0, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 190, 194, 189),
                                  ),
                                ),
                                color: Color(0xFFE8E8E6),
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextField(
                                      controller: passwordController
                                        ..text = '111112',
                                      obscureText: isHidden,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: isHidden
                                                ? Icon(Icons.visibility_off)
                                                : Icon(Icons.visibility),
                                            onPressed: () => {
                                              setState(
                                                  () => {isHidden = !isHidden})
                                            },
                                          ),
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 46, 43, 59))),
                                      style: TextStyle(
                                          color: Color(0xFF494087), height: 1)),
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
                    margin: const EdgeInsets.fromLTRB(30, 480, 30, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset(8, 6),
                                color: Color.fromARGB(255, 46, 43, 59))
                          ], borderRadius: BorderRadius.circular(15)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(500, 50),
                              primary: Color(0xFF7A6DA9),
                              shadowColor: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              side: BorderSide(
                                  width: 1, color: Color(0xFF103A24)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(100, 0, 5, 0),
                                  child: Text('Anmelden',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 46, 43, 59))),
                                ),
                                Icon(Icons.arrow_forward,
                                    color: Color.fromARGB(255, 46, 43, 59))
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
                                      color: Color(0xFF103A24), fontSize: 14)),
                            ),
                        ]))
                      ],
                    )),
                if (signInStatusMessage == 'Ladet...')
                  Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 600, 0, 0),
                      child: const CircularProgressIndicator(),
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
