import 'package:flutter/material.dart';
import 'package:PingPongScorer/drawer.dart';

class HelpPage extends StatelessWidget
{
  final _scorerHelp = """To add to the score of a team, simply tap on the corresponding side of device to add a point to the relevant team.\n
To reduce the score in case of an accident, double tap the space to reduce the score of the relevant team.""";
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: Text("Help")
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text("Scorer",
                  style: Theme.of(context).textTheme.headline
                ),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Flexible(
                  child: Text(
                    _scorerHelp,
                    style: Theme.of(context).textTheme.body1,
                  )
                )
              ]
            )
          )
        ],
      )
    );
  }
}