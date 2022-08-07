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
      color: Color(0xFF111111),
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
                                    color: Color(0xFF494087))),
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
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Color(0xFF181818),
                              margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                child: TextField(
                                    controller: emailController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color: Color(0xFF494087))),
                                    style: TextStyle(
                                        color: Color(0xFF494087), height: 1)),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              color: Color(0xFF181818),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          primary: Color(0xFFFCC204),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(90, 0, 5, 0),
                              child: Text('Anmelden',
                                  style: TextStyle(color: Color(0xFF494087))),
                            ),
                            Icon(Icons.arrow_forward, color: Color(0xFF494087))
                          ],
                        ),
                        onPressed: () => sign_in(
                            email: emailController.text,
                            password: passwordController.text),
                      ),
                      Align(
                          child: Column(children: [
                        if (signInStatusMessage == 'Ladet...')
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(signInStatusMessage.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14)),
                          )
                        else
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(signInStatusMessage.toString(),
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 14)),
                          ),
                      ]))
                    ],
                  )),
              if (signInStatusMessage == 'Ladet...')
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 580, 0, 0),
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
