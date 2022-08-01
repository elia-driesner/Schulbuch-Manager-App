import 'package:flutter/material.dart';
import 'firebaseAuth.dart';

import 'registerSelectionPage.dart';
import 'globalAuthVariables.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? signUpStatusMessage = '';

  void sign_up({required String email, required String password}) async {
    if (email == '') {
      signUpStatusMessage = 'Bitte Email Adresse eingeben';
    } else {
      var user = Auth(email: email, password: password);
      signUpStatusMessage = await user.signUp();
      if (signUpStatusMessage == null) {
        signUpStatusMessage = 'Email Adresse nicht verfügbar';
      }
      setState(() {
        signUpStatusMessage;
      });
      if (signUpStatusMessage == 'Account erstellt') {
        signUpStatusMessage = 'Anmelden...';
        setState(() {
          signUpStatusMessage;
        });
        await Future.delayed(const Duration(seconds: 2));
        var signInMessage = user.signIn();
        while (signInMessage == null) {
          await Future.delayed(const Duration(seconds: 1));
          signInMessage = user.signIn();
        }
        setState(() {
          signUpStatusMessage = 'Laden...';
        });
        user.addUserToFirestore();
      }
    }
    setState(() {
      signUpStatusMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5EFE2),
        child: SafeArea(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                  color: const Color(0xFFF5EFE2),
                  child: Stack(children: [
                    Container(
                      child: FlatButton(
                          onPressed: () => {},
                          child: const Text('Anmelden',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 175, 163, 160),
                                  fontSize: 18))),
                      margin: const EdgeInsets.fromLTRB(260, 30, 0, 0),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 25, 0, 45),
                                child: const Text('Registrieren',
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Color(0xFF1F2226),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Card(
                              color: Color.fromARGB(255, 228, 218, 205)
                                  .withOpacity(0.8),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 300,
                                width: 1000,
                                child: Column(
                                  children: [],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                        child: Column(children: [
                      if (signUpStatusMessage == 'Account erstellt' ||
                          signUpStatusMessage == 'Anmelden...' ||
                          signUpStatusMessage == 'Laden...')
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(signUpStatusMessage.toString(),
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 14)),
                        )
                      else
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(signUpStatusMessage.toString(),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14)),
                        ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 400, 40, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(500, 50),
                              primary: const Color(0xFF2F2E2C),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text('Account erstellen',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => sign_up(
                                email: emailController.text,
                                password: passwordController.text),
                          )),
                      if (signUpStatusMessage == 'Account erstellt' ||
                          signUpStatusMessage == 'Anmelden...')
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                          child: const CircularProgressIndicator(),
                        ),
                      if (signUpStatusMessage != 'Account wird erstellt...')
                        Container(
                          child: FlatButton(
                              onPressed: () => {},
                              child: const Text(
                                  'Sie haben bereits ein Konto? Anmelden.')),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        )
                      else
                        Container()
                    ]))
                  ])),
            )
          ]),
        ),
      ),
    );
    ;
  }
}
