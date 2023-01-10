import 'package:flutter/material.dart';
import '../../../codeScanner/qrCodeWidget.dart';

class addBookButton extends StatelessWidget {
  final uid;
  addBookButton({Key? key, required this.uid}) : super(key: key);

  void initState() {
    debugPrint(uid);
  }

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
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    qrCodeScannerWidget(purpose: 'login', uid: this.uid)),
          )
        },
      ),
    );
  }
}

class reportDamageButton extends StatelessWidget {
  const reportDamageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 50),
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
              child: Text('Schaden melden',
                  style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.book_outlined, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {},
      ),
    );
  }
}

class logoutBookButton extends StatelessWidget {
  const logoutBookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 50),
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
              child: Text('Buch abmelden',
                  style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.logout, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => qrCodeScannerWidget(purpose: 'logout')),
          )
        },
      ),
    );
  }
}

class loginBookButton extends StatelessWidget {
  var studentUid;
  loginBookButton({Key? key, required this.studentUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(190, 50),
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
              child: Text('Buch anmelden',
                  style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.login, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    qrCodeScannerWidget(purpose: 'login', uid: studentUid)),
          )
        },
      ),
    );
  }
}
