import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth/signInPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../userData.dart';

class sideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void signUserOut() {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => signInPage()),
        (Route<dynamic> route) => false,
      );
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: FaIcon(FontAwesomeIcons.userCircle),
              title: Text(userDataVar['name']),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Abmelden'),
              onTap: () => {signUserOut()},
            ),
          ],
        ),
      ),
    );
  }
}
