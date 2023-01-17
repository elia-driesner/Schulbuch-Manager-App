import 'package:flutter/material.dart';
import 'getDamages.dart';

class bookDamageView extends StatefulWidget {
  var bookInfo;
  bookDamageView({Key? key, required this.bookInfo}) : super(key: key);

  @override
  State<bookDamageView> createState() => _bookDamageViewState();
}

class _bookDamageViewState extends State<bookDamageView> {
  void initState() {
    getDamages(widget.bookInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('a'));
  }
}
