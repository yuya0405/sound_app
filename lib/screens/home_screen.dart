import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("アラート音声"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(child: Text("お薬を飲む時間です", style: TextStyle(fontSize: 20.0))),
            Row(
              children: [
                _soundButton(),
                _soundButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _soundButton() {
    return RaisedButton(

    );
  }
}
