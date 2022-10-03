import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../user_data_cache.dart';
import 'changePassword/changePasswordCard.dart';

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
      color: Colors.white,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(offset: Offset(2, 2), color: Color(0xFF18191F))
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

                  primary: Colors.white,
                  onPrimary: Color(0xFF18191F),

                  side: BorderSide(width: 1, color: Color(0xFF103A24))),
            ),
          ),
          changePasswordCard(),
        ],
      )),
    ));
  }
}
