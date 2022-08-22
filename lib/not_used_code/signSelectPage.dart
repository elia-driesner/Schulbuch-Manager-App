import 'package:flutter/material.dart';
import 'registerSelectionPage.dart';
import '../auth/signInPage.dart';
import 'package:google_fonts/google_fonts.dart';

class signSelectPage extends StatelessWidget {
  const signSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF191919),
            child: Stack(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(40, 120, 0, 45),
                  child: Text('Schulbuch Manager',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0,
                        fontSize: 55,
                        color: Color(0xFFFEFEFE),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 500, 40, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50),
                      primary: Color.fromARGB(220, 229, 98, 58),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text('Anmelden',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signInPage()),
                          )
                        }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 590, 40, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50),
                      primary: Color.fromARGB(220, 37, 221, 132),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text('Registrieren',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => registerSelectionPage()),
                          )
                        }),
              ),
            ])));
  }
}
