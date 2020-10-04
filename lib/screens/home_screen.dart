import "package:flutter/material.dart";

import "package:soundpool/soundpool.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> _texts = ["❌ キャンセル", "⭕️ 飲みました"];

  List<int> _soundIds = [0, 0];

  Soundpool _soundpool;

  @override
  void initState() {
    _soundpool = Soundpool();
    super.initState();
  }

  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }

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
                  Expanded(flex: 1, child: _soundButton(_texts[0], _soundIds[0])),
                  Expanded(flex: 1, child: _soundButton(_texts[1], _soundIds[1]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, int soundId) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: null, //TODO 音を鳴らす
          child: Text(displayText),
        ));
  }
}
