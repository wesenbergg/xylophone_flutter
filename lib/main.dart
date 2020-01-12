import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final _colorData = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void playSound(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }

  Widget playButton(int buttonNum) {
    return Expanded(
      child: FlatButton(
        onPressed: () => playSound(buttonNum+1),
        color: _colorData[buttonNum],
        child: null,
      ),
    );
  }

  Widget buildButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < _colorData.length; i++) playButton(i)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: buildButtons(),
          ),
        ),
      ),
    );
  }
}
