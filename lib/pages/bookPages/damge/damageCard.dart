import 'package:flutter/material.dart';

class damageCard extends StatelessWidget {
  var damageInfo;
  damageCard({Key? key, required this.damageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Row(children: [
        Column(
          children: [Text(damageInfo['name'], style: TextStyle(fontSize: 20))],
        )
      ]),
    ));
  }
}
