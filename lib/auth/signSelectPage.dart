import 'package:flutter/material.dart';
import 'registerSelectionPage.dart';
import 'signInPage.dart';

class signSelectPage extends StatelessWidget {
  const signSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFF5EFE2),
            child: Stack(children: [
              ClipRect(
                child: Container(
                  width: 500,
                  height: 750,
                  child: CustomPaint(
                    child: Container(),
                    painter: orangePainter(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 250,
                  margin: const EdgeInsets.fromLTRB(40, 120, 0, 45),
                  child: const Text('Schulbuch Manager',
                      style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF1F2226),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 500, 40, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(500, 50),
                      primary: const Color(0xFF2F2E2C),
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
                      primary: const Color(0xFF2F2E2C),
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

class orangePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(330, 30);
    canvas.drawCircle(
        Offset(0, 0), 450, Paint()..color = Color.fromARGB(255, 254, 195, 195));

    canvas.restore();
    canvas.save();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
