import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Layouts"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Row Widget",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.person, size: 40),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Stack Widget",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 320,
                  height: 320,
                  color: Color(0xff5921f3),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Color(0xff00b7ff),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
