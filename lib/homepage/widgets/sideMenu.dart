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
            Stack(children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.userCircle, size: 42),
              ),
              Column(
                children: [
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                userDataVar['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  userDataVar['email'],
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => {},
                  ),
                ],
              ),
            ]),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Bücher'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.users),
              title: Text('Familie'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Divider(
                thickness: 0,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
                height: 0,
              ),
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
