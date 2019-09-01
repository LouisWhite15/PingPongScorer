import 'package:PingPongScorer/ranking.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:PingPongScorer/help.dart';
import 'package:PingPongScorer/scorer.dart';

class CustomDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Navigation",
                style: Theme.of(context).textTheme.title,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor
              ),
            ),
            ListTile(
              leading: Icon(Icons.exposure),
              title: Text("Scorer",
                style: Theme.of(context).textTheme.title
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PingPongScorer()));
              }
            ),
            ListTile(
              leading: Icon(Icons.error_outline),
              title: Text("Overall Ranking",
                style: Theme.of(context).textTheme.title
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ranking()));
              }
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Help",
                style: Theme.of(context).textTheme.title
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
              }
            ),
          ],
        )
      );
  }
}