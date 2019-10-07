import 'package:PingPongScorer/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ranking extends StatefulWidget {
  Ranking({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> 
{
  SharedPreferences _prefs;
  int _playerOneScore = 0;

  void _incrementPlayerOne()
  {
    setState(() {
      _playerOneScore++;
      return _playerOneScore;
    });
  }

  void _decrementPlayerOne()
  {
    setState(() {
      if (_playerOneScore == 0)
        return _playerOneScore;
      _playerOneScore--;
      return _playerOneScore;
    });
  }

  void _reset()
  {
    setState(() {
      _playerOneScore = 0;
      _save("_playerOneScore", _playerOneScore);
    });
  }

  int _read(String key)
  {
    return _prefs.getInt(key);
  }

  _save(String key, value)
  {
    _prefs.setInt(key, value);
  }

  @override
  void initState()
  {
    super.initState();
    asyncInitState();
  }

  Future asyncInitState() async {
    _prefs = await SharedPreferences.getInstance();
    _playerOneScore = _read("_playerOneScore");
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
      future: asyncInitState(),
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {
        if (snapshot.connectionState != ConnectionState.done)
        {
          // no op
          // This is here so that the players values appear when you load the page
          // There may be other ways to do this
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Overall Ranking")),
          drawer: CustomDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Player name",
                      style: Theme.of(context).textTheme.title
                    ),
                    Spacer(),
                    Text("Games won",
                      style: Theme.of(context).textTheme.title
                    )
                  ],
                ),
              ),
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
                      onPressed: () { 
                        _decrementPlayerOne();
                        _save("_playerOneScore", _playerOneScore);
                      }
                    ),
                    Text(_playerOneScore.toString(),
                      style: Theme.of(context).textTheme.headline,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _incrementPlayerOne();
                        _save("_playerOneScore", _playerOneScore);
                      }
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
    );
  }
}