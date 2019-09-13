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
  int _playerOne;

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
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Player One", 
                      style: Theme.of(context).textTheme.body1,
                    )
                  )
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter name"
                      ),
                    )
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}