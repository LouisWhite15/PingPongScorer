import 'package:PingPongScorer/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  Ranking({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> 
{
  String _playerOneName = "Tap here to set name";
  int _playerOne;

  void setPlayerName(String name)
  {
    _playerOneName = name;
  }

  void _incrementPlayerOne()
  {
    setState(() {
      _playerOne++;
    });
  }

  void _decrementPlayerOne()
  {
    setState(() {
      if (_playerOne == 0)
        return;
      _playerOne--;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overall Ranking")),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(13.0),
            child: Row(
              children: <Widget>[
                Text("Player One: ",
                  style: Theme.of(context).textTheme.title
                )
              ],
            ),
          )
        ],
      )
    );
  }
}