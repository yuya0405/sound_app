import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //String _text01 = "❌ キャンセル";
  //String _text02 = "⭕️ 飲みました";

  List<String> _texts = ["❌ キャンセル", "⭕️ 飲みました"];

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
            Expanded(
                child: Center(
                    child:
                        Text("お薬を飲む時間です", style: TextStyle(fontSize: 20.0)))),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 1, child: _soundButton(_texts[0])),
                  Expanded(flex: 1, child: _soundButton(_texts[1]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text(displayText),
        ));
  }
}
