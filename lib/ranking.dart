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
  int _playerOne = 0;

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

  void _reset()
  {
    setState(() {
      _playerOne = 0;
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
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter name"
                    ),
                  )
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementPlayerOne
                ),
                Text('$_playerOne',
                  style: Theme.of(context).textTheme.headline,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementPlayerOne
                )
              ],
            ),
          ),
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