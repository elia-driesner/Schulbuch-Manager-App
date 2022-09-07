// import 'package:flutter/material.dart';
// import '../auth/firebaseAuth.dart';

// import 'registerSelectionPage.dart';
// import '../auth/globalAuthVariables.dart';
// import '../main.dart';

// class registerPage extends StatefulWidget {
//   const registerPage({Key? key}) : super(key: key);

//   @override
//   State<registerPage> createState() => _registerPageState();
// }

// class _registerPageState extends State<registerPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   String? signUpStatusMessage = '';

//   void sign_up({required String email, required String password}) async {
//     if (email == '') {
//       signUpStatusMessage = 'Bitte Email Adresse eingeben';
//     } else {
//       var user = Auth(email: email, password: password);
//       signUpStatusMessage = await user.signUp();
//       if (signUpStatusMessage == null) {
//         signUpStatusMessage = 'Email Adresse nicht verfügbar';
//       }
//       setState(() {
//         signUpStatusMessage;
//       });
//       if (signUpStatusMessage == 'Account erstellt') {
//         signUpStatusMessage = 'Anmelden...';
//         setState(() {
//           signUpStatusMessage;
//         });
//         await Future.delayed(const Duration(seconds: 2));
//         var signInMessage = user.signIn();
//         while (signInMessage == null) {
//           await Future.delayed(const Duration(seconds: 1));
//           signInMessage = user.signIn();
//         }
//         setState(() {
//           signUpStatusMessage = 'Laden...';
//         });
//         user.addUserToFirestore();
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => App()),
//         );
//       }
//     }
//     setState(() {
//       signUpStatusMessage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       color: const Color(0xFFF5EFE2),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               ClipRect(
//                 child: Container(
//                   width: 500,
//                   height: 750,
//                   child: CustomPaint(
//                     child: Container(),
//                     painter: yellowPainter(),
//                   ),
//                 ),
//               ),
//               ClipRect(
//                 child: Container(
//                   width: 500,
//                   height: 750,
//                   child: CustomPaint(
//                     child: Container(),
//                     painter: orangePainter(),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: FlatButton(
//                     onPressed: () => {},
//                     child: const Text('Anmelden',
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 175, 163, 160),
//                             fontSize: 18))),
//                 margin: const EdgeInsets.fromLTRB(270, 30, 0, 0),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Container(
//                           margin: const EdgeInsets.fromLTRB(15, 25, 0, 45),
//                           child: const Text('Registrieren',
//                               style: TextStyle(
//                                   fontSize: 32,
//                                   color: Color(0xFF1F2226),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                       Card(
//                         margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
//                         color:
//                             Color.fromARGB(255, 228, 218, 205).withOpacity(0.8),
//                         shadowColor: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Container(
//                           height: 260,
//                           child: Column(children: [
//                             Card(
//                               shadowColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               color: Color.fromARGB(255, 228, 218, 205)
//                                   .withOpacity(0),
//                               margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
//                               child: Container(
//                                 margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
//                                 child: TextField(
//                                   controller: emailController,
//                                   obscureText: false,
//                                   decoration: const InputDecoration(
//                                     labelText: 'Email Adresse',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Card(
//                               shadowColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               color: Color.fromARGB(255, 228, 218, 205)
//                                   .withOpacity(0),
//                               margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
//                               child: Container(
//                                 margin: const EdgeInsets.fromLTRB(15, 7, 5, 0),
//                                 child: TextField(
//                                     controller: passwordController,
//                                     obscureText: true,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Password',
//                                     )),
//                               ),
//                             ),
//                           ]),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                   margin: const EdgeInsets.fromLTRB(40, 485, 40, 0),
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(500, 50),
//                           primary: const Color(0xFF2F2E2C),
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                         ),
//                         child: const Text('Account erstellen',
//                             style: TextStyle(color: Colors.white)),
//                         onPressed: () => sign_up(
//                             email: emailController.text,
//                             password: passwordController.text),
//                       ),
//                       Align(
//                           child: Column(children: [
//                         if (signUpStatusMessage == 'Account erstellt' ||
//                             signUpStatusMessage == 'Anmelden...' ||
//                             signUpStatusMessage == 'Laden...')
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                             child: Text(signUpStatusMessage.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.black, fontSize: 14)),
//                           )
//                         else
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                             child: Text(signUpStatusMessage.toString(),
//                                 style: const TextStyle(
//                                     color: Colors.red, fontSize: 14)),
//                           ),
//                       ]))
//                     ],
//                   )),
//               if (signUpStatusMessage == 'Account erstellt' ||
//                   signUpStatusMessage == 'Anmelden...')
//                 Center(
//                   child: Container(
//                     margin: const EdgeInsets.fromLTRB(0, 580, 0, 0),
//                     child: const CircularProgressIndicator(),
//                   ),
//                 ),
//             ],
//           ),
//           if (signUpStatusMessage != 'Account wird erstellt...')
//             Container(
//               child: FlatButton(
//                   onPressed: () => {},
//                   child: const Text('Sie haben bereits ein Konto? Anmelden.')),
//               margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//             )
//           else
//             Container()
//         ],
//       ),
//     ));
//     ;
//   }
// }
