import 'package:flutter/material.dart';

class bookView extends StatelessWidget {
  const bookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: SafeArea(child: Container(child: Text('a')))));
  }
}
