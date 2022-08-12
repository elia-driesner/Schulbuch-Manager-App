import 'package:flutter/material.dart';
import 'widgets/sideMenu.dart';

import '../userData.dart';

class studentHomepage extends StatelessWidget {
  const studentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFECEBE7),
        child: SafeArea(child: Column(children: [])));
  }
}
