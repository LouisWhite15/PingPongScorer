import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PingPongScorer extends StatefulWidget {
  PingPongScorer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PingPongScorerState createState() => _PingPongScorerState();
}

class _PingPongScorerState extends State<PingPongScorer> 
{
  int _teamOneCounter = 0;
  int _teamTwoCounter = 0;

  void _incrementTeamOneCounter() 
  {
    setState(() {
      _teamOneCounter++;
    });
  }

  void _incrementTeamTwoCounter()
  {
    setState(() {
      _teamTwoCounter++;
    });
  }

  void _resetCounters()
  {
    setState(() {
      _teamOneCounter = 0;
      _teamTwoCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ping Pong Scorer")),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$_teamOneCounter',
                    style: Theme.of(context).textTheme.display1
                    )
                  ],
                )
              ),
              onTap: _incrementTeamOneCounter
            )
          ),
          Expanded(
            child: InkWell(
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$_teamTwoCounter',
                    style: Theme.of(context).textTheme.display1
                    )
                  ],
                )
              ),
              onTap: _incrementTeamTwoCounter
            )
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _resetCounters,
        label: Text("Reset"),
        icon: Icon(Icons.replay),
        backgroundColor: Colors.white,
      )
    );
  }
}