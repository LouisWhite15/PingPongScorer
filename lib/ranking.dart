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
  var _playerScores = [0, 0];

  void _incrementPlayer(int index)
  {
    setState(() {
      _playerScores[index]++;
    });
  }

  void _decrementPlayer(int index)
  {
    setState(() {
      if (_playerScores[index] == 0)
        return;
      _playerScores[index]--;
    });
  }

  void _reset()
  {
    setState(() {
      for(var i = 0; i < _playerScores.length; i++)
      {
        _playerScores[i] = 0;
      }
    });
  }

  void _addPlayer()
  {

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
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter name"
                    ),
                  )
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementPlayer(0)
                ),
                Text(_playerScores[0].toString(),
                  style: Theme.of(context).textTheme.headline,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementPlayer(0)
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter name"
                    ),
                  )
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementPlayer(1)
                ),
                Text(_playerScores[1].toString(),
                  style: Theme.of(context).textTheme.headline,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementPlayer(1)
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _reset,
        label: Text("Reset"),
        icon: Icon(Icons.replay),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      )
    );
  }
}