import 'package:flutter/material.dart';
import 'getDamages.dart';
import 'damageCard.dart';

class bookDamageView extends StatefulWidget {
  var bookInfo;
  bookDamageView({Key? key, required this.bookInfo}) : super(key: key);

  @override
  State<bookDamageView> createState() => _bookDamageViewState();
}

class _bookDamageViewState extends State<bookDamageView> {
  List<Widget> damageCards = [];
  void createDmageCards() async {
    var damages = await getDamages(widget.bookInfo);
    for (var bookDamages in damages) {
      debugPrint(bookDamages.toString());
      damageCards.add(damageCard(damageInfo: bookDamages));
    }
    setState(() {
      damageCards;
    });
  }

  void initState() {
    createDmageCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: damageCards,
      ),
    );
  }
}
