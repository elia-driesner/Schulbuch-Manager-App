import 'package:flutter/material.dart';
import '../globalAuthVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class selectionCard extends StatefulWidget {
  selectionCard({Key? key}) : super(key: key);

  @override
  State<selectionCard> createState() => selectionCardState();
}

class selectionCardState extends State<selectionCard> {
  var schoolDropdownValue = '';

  var _schoolDropdownOptions = [];

  var roleDropdownValue = 'Schüler';

  var _roleDropdownOptions = ['Schüler', 'Lehrer', 'Elternteil'];

  var classDropdownValue = '9';

  var _classDropdownOptions = ['10', '9', '8', '7', '6', '5'];

  Future<void> getData() async {
    final schoolData = FirebaseFirestore.instance;
    var result = await schoolData.collection('Schools').get();
    var schools = [];
    result.docs.forEach((res) {
      schools.add(res.id);
    });

    setState(() {
      _schoolDropdownOptions = schools;
    });
    schoolDropdownValue = _schoolDropdownOptions[0];
  }

  void writeDataToGlobal() {
    setState(() {
      schoolDropdownValue;
      roleDropdownValue;
      classDropdownValue;
    });
    selectionData['school'] = schoolDropdownValue;
    selectionData['role'] = roleDropdownValue;
    selectionData['class'] = classDropdownValue;
  }

  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 300,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Card(
          color: Color.fromARGB(255, 228, 218, 205).withOpacity(0.8),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(children: [
                Container(
                    child: Text('Schule:', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color:
                          Color.fromARGB(255, 228, 218, 205).withOpacity(0.0),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: DropdownButton(
                        elevation: 0,
                        dropdownColor: const Color(0xFFF5EDE3),
                        hint: schoolDropdownValue == null
                            ? const Text('Keine schulen gefunden')
                            : Text(
                                schoolDropdownValue,
                                style: TextStyle(color: Colors.black),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.black),
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
                              schoolDropdownValue = val.toString();
                            },
                          );
                        },
                      )),
                ),
                Container(
                    child: Text('Rolle:', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color.fromARGB(255, 228, 218, 205).withOpacity(0),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: DropdownButton(
                        elevation: 0,
                        dropdownColor: const Color(0xFFF5EDE3),
                        hint: schoolDropdownValue == null
                            ? const Text('Dropdown')
                            : Text(
                                roleDropdownValue,
                                style: TextStyle(color: Colors.black),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.black),
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
                              roleDropdownValue = val.toString();
                            },
                          );
                        },
                      )),
                ),
                Container(
                    child: Text('Klasse:', style: TextStyle(fontSize: 18))),
                SizedBox(
                  width: 200,
                  child: Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color.fromARGB(255, 228, 218, 205).withOpacity(0),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: DropdownButton(
                        elevation: 0,
                        dropdownColor: const Color(0xFFF5EDE3),
                        hint: schoolDropdownValue == null
                            ? const Text('Dropdown')
                            : Text(
                                classDropdownValue,
                                style: TextStyle(color: Colors.black),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(color: Colors.black),
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
                              classDropdownValue = val.toString();
                            },
                          );
                        },
                      )),
                ),
              ]),
            ),
          ])),
    );
  }
}