import 'package:flutter/material.dart';
import 'package:PingPongScorer/drawer.dart';

class HelpPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      drawer: CustomDrawer(),
      body: Text("Help Page")
    );
  }
}