import 'package:flutter/material.dart';

class addBookButton extends StatelessWidget {
  const addBookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 50),
          primary: Color.fromARGB(0, 255, 188, 18),
          shadowColor: Color.fromARGB(0, 24, 25, 31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          side: BorderSide(width: 3, color: Color(0xFF18191F)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text('Bücher hinzufügen',
                  style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.add, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {},
      ),
    );
  }
}

class placeholder extends StatelessWidget {
  const placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 50),
          primary: Color.fromARGB(0, 255, 188, 18),
          shadowColor: Color.fromARGB(0, 24, 25, 31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          side: BorderSide(width: 3, color: Color(0xFF18191F)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text('Placeholder button',
                  style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.add, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {},
      ),
    );
  }
}
