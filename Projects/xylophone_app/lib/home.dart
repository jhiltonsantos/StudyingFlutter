import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatelessWidget {
  Widget _noteBottom(Color color, int number, String note) {
    return Expanded(
      child: Card(
        child: Center(
          child: InkWell(
            onTap: () {
              final player = AudioCache();
              player.play('note$number.wav');
            },
            child: Center(
              child: Text(
                '$note',
                style: TextStyle(color: Colors.white, fontSize: 28.0),
                textAlign: TextAlign.center,
              ),
            ),
            enableFeedback: false,
          ),
        ),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _noteBottom(Colors.orange, 7, 'B  Si'),
            _noteBottom(Colors.yellow, 6, 'A  Lá'),
            _noteBottom(Colors.green, 5, 'G  Sol'),
            _noteBottom(Colors.teal, 4, 'F  Fá'),
            _noteBottom(Colors.lightBlue, 3, 'E  Mi'),
            _noteBottom(Colors.blue[700], 2, 'D  Ré'),
            _noteBottom(Colors.purple, 1, 'C  Dó'),
          ],
        ),
      ),
    );
  }
}
