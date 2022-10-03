import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../auth/signInPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../user_data_cache.dart';
import '../../../pages/settings/settingsPage.dart';

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
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.userCircle,
                    size: 42, color: Color(0xFF18191F)),
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

                                  color: Color(0xFF18191F),

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
                                  style: TextStyle(
                                    fontSize: 15,

                                    color: Color(0xFF18191F),

                                  ),
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

              leading: Icon(Icons.book_outlined, color: Color(0xFF18191F)),
              title: Text('Bücher',
                  style: TextStyle(
                    color: Color(0xFF18191F),

                  )),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(

              leading: FaIcon(FontAwesomeIcons.user, color: Color(0xFF18191F)),
              title: Text('Familie',
                  style: TextStyle(
                    color: Color(0xFF18191F),

                  )),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(

              leading: Icon(Icons.settings_outlined, color: Color(0xFF18191F)),
              title: Text('Einstellungen',
                  style: TextStyle(
                    color: Color(0xFF18191F),

                  )),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingsPage()),
                )
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Divider(
                thickness: 0,
                indent: 20,
                endIndent: 20,
                color: Color(0xFF18191F),
                height: 0,
              ),
            ),
            ListTile(

              leading: Icon(Icons.exit_to_app, color: Color(0xFF18191F)),
              title: Text('Abmelden',
                  style: TextStyle(
                    color: Color(0xFF18191F),

                  )),
              onTap: () => {signUserOut()},
            ),
          ],
        ),
      ),
    );
  }
}
