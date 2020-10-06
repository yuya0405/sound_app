import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import "package:soundpool/soundpool.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _texts = ["❌ キャンセル", "⭕️ 飲みました"];
  List<int> _soundIds = [0, 0];
  Soundpool _soundpool;
  Widget _imageWidget = Image.asset("assets/images/medical_kusuri_nomiwasure_man.png");

  @override
  void initState() {
    super.initState();
    _initSounds();
    print("initState終わった＝buildメソッド回った");
  }

  Future<void> _initSounds() async {
    _soundpool = Soundpool();

    _soundIds[0] = await loadSound("assets/sounds/cancel3.mp3");
    _soundIds[1] = await loadSound("assets/sounds/decision3.mp3");
    print("initState終わった＝効果音ロード終わった");
    setState(() {

    });
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
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
            Expanded(child: _imageWidget),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 1, child: _soundButton(_texts[0], _soundIds[0])),
                  Expanded(
                      flex: 1, child: _soundButton(_texts[1], _soundIds[1]))
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
          onPressed: () => _playSound(soundId),
          child: Text(displayText),
        ));
  }

  void _playSound(int soundId) {
    _soundpool.play(soundId);
    _imageWidget = Image.asset("assets/images/hand_good.png");
  }
}
