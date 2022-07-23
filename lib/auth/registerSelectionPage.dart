import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globalAuthVariables.dart';

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
  Future<void> getData() async {
    final db = FirebaseFirestore.instance;
    var result = await db.collection('Schools').get();
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
  }

  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        color: const Color(0xFFFAFAFA),
        margin: EdgeInsets.fromLTRB(0, 160, 0, 0),
        child: Column(
          children: [
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
                      color: const Color(0xFFFFFFFF),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: DropdownButton(
                        hint: schoolDropdownValue == null
                            ? const Text('Dropdown')
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
                      color: const Color(0xFFFFFFFF),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: DropdownButton(
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
                    margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          primary: const Color(0xFFFBB827),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Weiter'),
                        onPressed: writeDataToGlobal)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
