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
    return Container(
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
                    painter: CanvasPainter(),
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
              Container(
                  margin: const EdgeInsets.fromLTRB(40, 522, 40, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(500, 50),
                        primary: const Color(0xFF2F2E2C),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text('Weiter',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        selection_card.selectionCardState().writeDataToGlobal();
                        debugPrint(selection_card
                            .selectionCardState()
                            .roleDropdownValue);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registerPage()),
                        );
                      })),
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
    );
  }
}

class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(380, 500);
    canvas.drawCircle(
        Offset(0, 0), 150, Paint()..color = Color.fromARGB(255, 253, 231, 151));

    canvas.restore();
    canvas.save();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
