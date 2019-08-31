import 'package:flutter/material.dart';
import 'package:PingPongScorer/scorer.dart';

void main() => runApp(PingPongScorerMain());

class PingPongScorerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ping Pong Scorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PingPongScorer(title: 'Ping Pong Scorer Home Page'),
    );
  }
}