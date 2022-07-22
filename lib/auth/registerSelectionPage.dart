import 'package:flutter/material.dart';

class registerSelectionPage extends StatefulWidget {
  const registerSelectionPage({Key? key}) : super(key: key);

  @override
  State<registerSelectionPage> createState() => _registerSelectionPageState();
}

class _registerSelectionPageState extends State<registerSelectionPage> {
  final _dropDownOptions = ['test'];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 150,
        child: Card(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.fromLTRB(17, 30, 17, 0),
            child: DropdownButton(
              hint: null == null
                  ? const Text('Dropdown')
                  : Text(
                      'DropdownValue',
                      style: TextStyle(color: Colors.orange),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Colors.orange),
              items: _dropDownOptions.map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {},
                );
              },
            )),
      ),
    ]);
  }
}
