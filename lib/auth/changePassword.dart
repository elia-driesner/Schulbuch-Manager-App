import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../user_data_cache.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';

import '../config/palette.dart';

class changePassword extends StatefulWidget {
  changePassword({Key? key, required this.oldPasswordSug}) : super(key: key);
  String oldPasswordSug;
  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  var changePasswordStatus = '';

  bool isOldHidden = true;
  bool isNewHidden = true;

  void resetPassword(oldPassword, newPassword) async {
    setState(() {
      changePasswordStatus = ' ';
    });
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: userDataVar['email'], password: oldPassword);

    if (user != null) {
      user.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword(newPassword).then((_) {
          setState(() {
            changePasswordStatus = ' ';
          });
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => App()),
            (Route<dynamic> route) => false,
          );
        }).catchError((error) {
          debugPrint(error.message);
          setState(() {
            if (error.message == 'Password should be at least 6 characters') {
              changePasswordStatus = 'Password min. 6 Zeichen';
            } else {
              changePasswordStatus = error.message;
            }
          });
        });
      }).catchError((err) {
        setState(() {
          if (err.message.toString() ==
              'The password is invalid or the user does not have a password.') {
            changePasswordStatus = 'Falsches password';
          } else {
            changePasswordStatus = err.message;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      child: Scaffold(
          body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: WHITE,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  if (widget.oldPasswordSug == '')
                    SafeArea(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, size: 20),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(13),
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: BLACK,
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 60, 0, 15),
                                child: Text('Password ändern',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0,
                                        fontSize: 30,
                                        color: BLACK)),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
                            color: BLACK.withOpacity(0),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 260,
                              child: Column(children: [
                                Card(
                                  shadowColor: Color.fromARGB(0, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: BLACK, width: 2),
                                  ),
                                  color: WHITE,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        widget.oldPasswordSug.length > 5
                                            ? TextField(
                                                controller:
                                                    oldPasswordController
                                                      ..text =
                                                          widget.oldPasswordSug,
                                                obscureText: isOldHidden,
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: isOldHidden
                                                          ? Icon(Icons
                                                              .visibility_off_outlined)
                                                          : Icon(Icons
                                                              .visibility_outlined),
                                                      onPressed: () => {
                                                        setState(() => {
                                                              isOldHidden =
                                                                  !isOldHidden
                                                            })
                                                      },
                                                    ),
                                                    border: InputBorder.none,
                                                    prefixIcon: Icon(
                                                        Icons.lock_outlined),
                                                    labelText: 'Altes Password',
                                                    labelStyle: TextStyle(
                                                        color: BLACK)),
                                                style: TextStyle(
                                                    color: BLACK, height: 1))
                                            : TextField(
                                                controller:
                                                    oldPasswordController,
                                                obscureText: isOldHidden,
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: isOldHidden
                                                          ? Icon(Icons
                                                              .visibility_off_outlined)
                                                          : Icon(Icons
                                                              .visibility_outlined),
                                                      onPressed: () => {
                                                        setState(() => {
                                                              isOldHidden =
                                                                  !isOldHidden
                                                            })
                                                      },
                                                    ),
                                                    border: InputBorder.none,
                                                    prefixIcon: Icon(
                                                        Icons.lock_outlined),
                                                    labelText: 'Altes Password',
                                                    labelStyle: TextStyle(
                                                        color: BLACK)),
                                                style: TextStyle(
                                                    color: BLACK, height: 1)),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  shadowColor: BLACK,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: BLACK, width: 2),
                                  ),
                                  color: WHITE,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: TextField(
                                        controller: newPasswordController,
                                        obscureText: isNewHidden,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: isNewHidden
                                                  ? Icon(Icons
                                                      .visibility_off_outlined)
                                                  : Icon(Icons
                                                      .visibility_outlined),
                                              onPressed: () => {
                                                setState(() => {
                                                      isNewHidden = !isNewHidden
                                                    })
                                              },
                                            ),
                                            border: InputBorder.none,
                                            prefixIcon:
                                                Icon(Icons.lock_outlined),
                                            labelText: 'Neues Password',
                                            labelStyle:
                                                TextStyle(color: BLACK)),
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
                      margin: const EdgeInsets.fromLTRB(30, 540, 30, 0),
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
                              onPressed: () => resetPassword(
                                  oldPasswordController.text,
                                  newPasswordController.text),
                            ),
                          ),
                          Align(
                              child: Column(children: [
                            if (changePasswordStatus == 'Password geändert')
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                                child: Text(changePasswordStatus.toString(),
                                    style: const TextStyle(
                                        color: BLACK, fontSize: 14)),
                              )
                            else
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                                child: Text(changePasswordStatus.toString(),
                                    style: const TextStyle(
                                        color: BLACK, fontSize: 14)),
                              ),
                          ])),
                          if (changePasswordStatus == ' ')
                            Center(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: const CupertinoActivityIndicator(
                                    radius: 18),
                              ),
                            ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
