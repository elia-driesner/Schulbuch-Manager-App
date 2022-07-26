import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globalAuthVariables.dart';
import 'registerPage.dart';

class registerSelectionPage extends StatefulWidget {
  const registerSelectionPage({Key? key}) : super(key: key);

  @override
  State<registerSelectionPage> createState() => _registerSelectionPageState();
}

class _registerSelectionPageState extends State<registerSelectionPage> {
  var schoolDropdownValue = '';
  var _schoolDropdownOptions = [];

  var roleDropdownValue = 'Schüler';
  var _roleDropdownOptions = ['Schüler', 'Lehrer', 'Elternteil'];
  var classDropdownValue = '9';
  var _classDropdownOptions = ['10', '9', '8', '7', '6', '5'];
  Future<void> getData() async {
    final schoolData = FirebaseFirestore.instance;
    var result = await schoolData.collection('Schools').get();
    result.docs.forEach((res) {
      setState(() {
        _schoolDropdownOptions.add(res.id);
        schoolDropdownValue = res.id;
      });
    });
  }

  void writeDataToGlobal() {
    selectionData['school'] = schoolDropdownValue;
    selectionData['role'] = roleDropdownValue;
    selectionData['class'] = classDropdownValue;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => registerPage()),
    );
  }

  void initState() {
    getData();
  }

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
                      Container(
                        width: 1000,
                        height: 300,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Card(
                            color: Color.fromARGB(255, 228, 218, 205)
                                .withOpacity(0.8),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Column(children: [
                                  Container(
                                      child: Text('Schule:',
                                          style: TextStyle(fontSize: 18))),
                                  SizedBox(
                                    width: 200,
                                    child: Card(
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color:
                                            Color.fromARGB(255, 228, 218, 205)
                                                .withOpacity(0.0),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: DropdownButton(
                                          elevation: 0,
                                          dropdownColor:
                                              const Color(0xFFF5EDE3),
                                          hint: schoolDropdownValue == null
                                              ? const Text('Dropdown')
                                              : Text(
                                                  schoolDropdownValue,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          items: _schoolDropdownOptions.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val,
                                                child: Text(val),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                schoolDropdownValue =
                                                    val.toString();
                                              },
                                            );
                                          },
                                        )),
                                  ),
                                  Container(
                                      child: Text('Rolle:',
                                          style: TextStyle(fontSize: 18))),
                                  SizedBox(
                                    width: 200,
                                    child: Card(
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color:
                                            Color.fromARGB(255, 228, 218, 205)
                                                .withOpacity(0),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: DropdownButton(
                                          elevation: 0,
                                          dropdownColor:
                                              const Color(0xFFF5EDE3),
                                          hint: schoolDropdownValue == null
                                              ? const Text('Dropdown')
                                              : Text(
                                                  roleDropdownValue,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          items: _roleDropdownOptions.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val,
                                                child: Text(val),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                roleDropdownValue =
                                                    val.toString();
                                              },
                                            );
                                          },
                                        )),
                                  ),
                                  Container(
                                      child: Text('Klasse:',
                                          style: TextStyle(fontSize: 18))),
                                  SizedBox(
                                    width: 200,
                                    child: Card(
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color:
                                            Color.fromARGB(255, 228, 218, 205)
                                                .withOpacity(0),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: DropdownButton(
                                          elevation: 0,
                                          dropdownColor:
                                              const Color(0xFFF5EDE3),
                                          hint: schoolDropdownValue == null
                                              ? const Text('Dropdown')
                                              : Text(
                                                  classDropdownValue,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                          isExpanded: true,
                                          iconSize: 30.0,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          items: _classDropdownOptions.map(
                                            (val) {
                                              return DropdownMenuItem<String>(
                                                value: val,
                                                child: Text(val),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                classDropdownValue =
                                                    val.toString();
                                              },
                                            );
                                          },
                                        )),
                                  ),
                                ]),
                              ),
                            ])),
                      )
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
                      onPressed: writeDataToGlobal)),
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
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
