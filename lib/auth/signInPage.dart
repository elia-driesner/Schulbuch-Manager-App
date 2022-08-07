import 'package:flutter/material.dart';
import 'firebaseAuth.dart';

import 'registerSelectionPage.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? signInStatusMessage = '';

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
      debugPrint(signInStatusMessage);
      await Future.delayed(const Duration(seconds: 2));
      if (signInStatusMessage == 'Ladet...') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => App()),
        );
      }
    }
    setState(() {
      signInStatusMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFFECEBE7),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: FlatButton(
                    onPressed: () => {},
                    child: const Text('Registrieren',
                        style: TextStyle(
                            color: Color.fromARGB(255, 175, 163, 160),
                            fontSize: 18))),
                margin: const EdgeInsets.fromLTRB(250, 30, 0, 0),
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
                            child: Text('Anmelden',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    fontSize: 30,
                                    color: Color(0xFF103A24))),
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
                              margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                child: TextField(
                                    controller: emailController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            color: Color(0xFF494087))),
                                    style: TextStyle(
                                        color: Color(0xFF494087), height: 1)),
                              ),
                            ),
                            Card(
                              shadowColor: Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 190, 194, 189),
                                ),
                              ),
                              color: Color(0xFFE8E8E6),
                              margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color: Color(0xFF494087))),
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
                  margin: const EdgeInsets.fromLTRB(40, 480, 40, 0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              offset: Offset(8, 6), color: Color(0xFF103A24))
                        ], borderRadius: BorderRadius.circular(15)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(500, 50),
                            primary: Color(0xFF7A6DA9),
                            shadowColor: Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            side:
                                BorderSide(width: 1, color: Color(0xFF103A24)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(90, 0, 5, 0),
                                child: Text('Anmelden',
                                    style: TextStyle(color: Color(0xFF103A24))),
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Color(0xFF103A24))
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
    ));
    ;
  }
}
