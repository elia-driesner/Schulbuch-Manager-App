import 'package:flutter/material.dart';

class registerSelectionPage extends StatefulWidget {
  const registerSelectionPage({Key? key}) : super(key: key);

  @override
  State<registerSelectionPage> createState() => _registerSelectionPageState();
}

class _registerSelectionPageState extends State<registerSelectionPage> {
  var roleDropdownValue = 'Schüler';
  var _roleDropdownOptions = ['Schüler', 'Lehrer', 'Admin'];
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
                    child:
                        Text('Ich bin ein:', style: TextStyle(fontSize: 18))),
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
                        hint: roleDropdownValue == null
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
