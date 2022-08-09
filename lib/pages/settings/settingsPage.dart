import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../userData.dart';
import '../../auth/changePassword.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

  void resetPassword(oldPassword, newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: userDataVar['email'], password: '111111');

    if (user != null) {
      user.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword('111112').then((_) {
          //Success, do something
        }).catchError((error) {
          debugPrint(error);
        });
      }).catchError((err) {
        debugPrint(err.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFFECEBE7),
      child: SafeArea(
          child: Column(
        children: [
          Container(
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
                  primary: Color(0xFF7A6DA9),
                  onPrimary: Color.fromARGB(255, 46, 43, 59),
                  side: BorderSide(width: 1, color: Color(0xFF103A24))),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => changePassword()),
              )
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            child: Icon(Icons.lock_outline_rounded, size: 30),
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                'Password ändern',
                                style: TextStyle(fontSize: 18),
                              )),
                              Container(
                                  child: Text(
                                      'Ändern sie ihr password in der App',
                                      style: TextStyle(fontSize: 14)))
                            ]),
                      ]),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Icon(Icons.keyboard_arrow_right, size: 30),
                      )
                    ])),
          )
        ],
      )),
    ));
  }
}
