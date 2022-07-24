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
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 160, 5, 0),
            child: Container(
                color: const Color(0xFFFAFAFA),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                      child: const Text('Registrieren',
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF1F2226),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                      child: Column(children: [
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: const Color(0xFFFFFFFF),
                      margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
                        child: TextField(
                          controller: emailController,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Email Adresse',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: const Color(0xFFFFFFFF),
                      margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
                        child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    if (signUpStatusMessage == 'Account erstellt' ||
                        signUpStatusMessage == 'Anmelden...')
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
                      margin: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(500, 50),
                            primary: const Color(0xFFFBB827),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('Account erstellen'),
                          onPressed: () => sign_up(
                              email: emailController.text,
                              password: passwordController.text)),
                    ),
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
    );
    ;
  }
}
