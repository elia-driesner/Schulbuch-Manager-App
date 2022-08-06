import 'package:flutter/material.dart';

class studentHomepage extends StatelessWidget {
  const studentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Column(children: [
      Container(
          child: GestureDetector(
              child: Icon(Icons.settings),
              onTap: () {
                debugPrint('a');
              }))
    ])));
  }
}
