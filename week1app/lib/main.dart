import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstWidget());
}

  class MyFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color.fromARGB(255, 125, 180, 225),
                const Color.fromARGB(255, 139, 172, 141),
              ])),
          // color: const Color.fromARGB(255, 152, 125, 215),
          child: Center(
              child: Text(
            'Mukund Kapadia 301403876',
            style: TextStyle(fontSize: 28),
          )),
        ),
      ),
    ));
  }
}
