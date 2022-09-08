import 'package:flutter/material.dart';

class classMemberCard extends StatelessWidget {
  classMemberCard(this.data);

  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        classMemberContainer(data),
        Column(children: [Text(data.name), Text(data.role)]),
      ],
    ));
  }

  @override
  Widget classMemberContainer(BuildContext context) {
    if (data.rights <= 500)
      return Container(color: Color(0xFFF95A2C), height: 30, width: 30);
    else
      return Container(color: Color(0xFF00C6AE), height: 30, width: 30);
  }
}
