import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:PingPongScorer/drawer.dart';
import 'package:swipedetector/swipedetector.dart';

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

  void _decrementTeamOneCounter()
  {
    setState(() {
      if (_teamOneCounter == 0)
        return;
      _teamOneCounter--;
    });
  }

  void _incrementTeamTwoCounter()
  {
    setState(() {
      _teamTwoCounter++;
    });
  }

  void _decrementTeamTwoCounter()
  {
    setState(() {
      if (_teamTwoCounter == 0)
        return;
      _teamTwoCounter--;
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
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              child: SwipeDetector(
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 2,
                        child: 
                        Text('$_teamOneCounter',
                          style: Theme.of(context).textTheme.display3,
                        ),
                      ),
                    ],
                  )
                ),
                onSwipeLeft: _incrementTeamOneCounter,
                onSwipeRight: _decrementTeamOneCounter,
              ),
              onTap: _incrementTeamOneCounter,
            )
          ),
          Expanded(
            child: InkWell(
              child: SwipeDetector(
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('$_teamTwoCounter',
                        style: Theme.of(context).textTheme.display3
                      )
                    ],
                  )
                ),
                onSwipeLeft: _decrementTeamTwoCounter,
                onSwipeRight: _incrementTeamTwoCounter,
              ),
              onTap: _incrementTeamTwoCounter,
            )
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _resetCounters,
        label: Text("Reset"),
        icon: Icon(Icons.replay),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      )
    );
  }
}