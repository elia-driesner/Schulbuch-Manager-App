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
      backgroundColor: Color(0xFFECEBE7),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.userCircle,
                    size: 42, color: Color.fromARGB(255, 46, 43, 59)),
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
                                  color: Color(0xFF494087),
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
                                    color: Color.fromARGB(255, 46, 43, 59),
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
              leading: Icon(Icons.book_outlined,
                  color: Color.fromARGB(255, 46, 43, 59)),
              title: Text('Bücher',
                  style: TextStyle(
                    color: Color(0xFF494087),
                  )),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.user,
                  color: Color.fromARGB(255, 46, 43, 59)),
              title: Text('Familie',
                  style: TextStyle(
                    color: Color(0xFF494087),
                  )),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined,
                  color: Color.fromARGB(255, 46, 43, 59)),
              title: Text('Einstellungen',
                  style: TextStyle(
                    color: Color(0xFF494087),
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
                color: Color.fromARGB(255, 46, 43, 59),
                height: 0,
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 46, 43, 59)),
              title: Text('Abmelden',
                  style: TextStyle(
                    color: Color(0xFF494087),
                  )),
              onTap: () => {signUserOut()},
            ),
          ],
        ),
      ),
    );
  }
}
