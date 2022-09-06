import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../user_data_cache.dart';
import '../main.dart';

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
      color: Color(0xFFECEBE7),
      child: Scaffold(
          body: SingleChildScrollView(
        reverse: true,
        child: Container(
          color: Color(0xFFECEBE7),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                children: [
                  if (widget.oldPasswordSug == '')
                    SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Color.fromARGB(255, 46, 43, 59))
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 320, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, size: 20),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(13),
                              primary: const Color(0xFFDF5953),
                              onPrimary: Color.fromARGB(255, 0, 0, 0),
                              side: BorderSide(
                                  width: 1, color: Color(0xFF103A24))),
                        ),
                      ),
                    ),
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
                                child: Text('Password ändern',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0,
                                        fontSize: 30,
                                        color:
                                            Color.fromARGB(255, 46, 43, 59))),
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
                                  shadowColor: Color.fromARGB(0, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 190, 194, 189),
                                    ),
                                  ),
                                  color: Color(0xFFE8E8E6),
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
                                                              .visibility_off)
                                                          : Icon(
                                                              Icons.visibility),
                                                      onPressed: () => {
                                                        setState(() => {
                                                              isOldHidden =
                                                                  !isOldHidden
                                                            })
                                                      },
                                                    ),
                                                    border: InputBorder.none,
                                                    prefixIcon:
                                                        Icon(Icons.lock),
                                                    labelText: 'Altes Password',
                                                    labelStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 46, 43, 59))),
                                                style: TextStyle(
                                                    color: Color(0xFF494087),
                                                    height: 1))
                                            : TextField(
                                                controller:
                                                    oldPasswordController,
                                                obscureText: isOldHidden,
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: isOldHidden
                                                          ? Icon(Icons
                                                              .visibility_off)
                                                          : Icon(
                                                              Icons.visibility),
                                                      onPressed: () => {
                                                        setState(() => {
                                                              isOldHidden =
                                                                  !isOldHidden
                                                            })
                                                      },
                                                    ),
                                                    border: InputBorder.none,
                                                    prefixIcon:
                                                        Icon(Icons.lock),
                                                    labelText: 'Altes Password',
                                                    labelStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 46, 43, 59))),
                                                style: TextStyle(
                                                    color: Color(0xFF494087),
                                                    height: 1)),
                                      ],
                                    ),
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
                                                  ? Icon(Icons.visibility_off)
                                                  : Icon(Icons.visibility),
                                              onPressed: () => {
                                                setState(() => {
                                                      isNewHidden = !isNewHidden
                                                    })
                                              },
                                            ),
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.lock),
                                            labelText: 'Neues Password',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 46, 43, 59))),
                                        style: TextStyle(
                                            color: Color(0xFF494087),
                                            height: 1)),
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
                                  primary: const Color(0xFFDF5953),
                                  shadowColor: Color.fromARGB(0, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  side: BorderSide(
                                      width: 1, color: Color(0xFF103A24)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Text('Ändern',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 46, 43, 59))),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Color.fromARGB(255, 46, 43, 59))
                                  ],
                                ),
                                onPressed: () => {
                                      resetPassword(oldPasswordController.text,
                                          newPasswordController.text)
                                    }),
                          ),
                          Align(
                              child: Column(children: [
                            if (changePasswordStatus == 'Password geändert')
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                                child: Text(changePasswordStatus.toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF103A24),
                                        fontSize: 14)),
                              )
                            else
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                                child: Text(changePasswordStatus.toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF103A24),
                                        fontSize: 14)),
                              ),
                          ])),
                          if (changePasswordStatus == ' ')
                            Center(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: const CircularProgressIndicator(),
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
