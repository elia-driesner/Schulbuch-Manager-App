import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globalAuthVariables.dart';
import 'registerPage.dart';
import 'widgets/selectionCard.dart' as selection_card;

class registerSelectionPage extends StatefulWidget {
  const registerSelectionPage({Key? key}) : super(key: key);

  @override
  State<registerSelectionPage> createState() => _registerSelectionPageState();
}

class _registerSelectionPageState extends State<registerSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5EFE2),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Container(
                    width: 500,
                    height: 750,
                    child: CustomPaint(
                      child: Container(),
                      painter: yellowPainter(),
                    ),
                  ),
                ),
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
                Container(
                  child: FlatButton(
                      onPressed: () => {},
                      child: const Text('Anmelden',
                          style: TextStyle(
                              color: Color.fromARGB(255, 175, 163, 160),
                              fontSize: 18))),
                  margin: const EdgeInsets.fromLTRB(270, 30, 0, 0),
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
                            margin: const EdgeInsets.fromLTRB(15, 25, 0, 45),
                            child: const Text('Registrieren',
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Color(0xFF1F2226),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        selection_card.selectionCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: FlatButton(
                  onPressed: () => {},
                  child: const Text('Sie haben bereits ein Konto? Anmelden.')),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            )
          ],
        ),
      ),
    );
  }
}

class yellowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(380, 500);
    canvas.drawCircle(
        Offset(0, 0), 150, Paint()..color = Color.fromARGB(255, 253, 234, 157));

    canvas.restore();
    canvas.save();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class orangePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(30, 30);
    canvas.drawCircle(
        Offset(0, 0), 90, Paint()..color = Color.fromARGB(255, 254, 195, 195));

    canvas.restore();
    canvas.save();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
