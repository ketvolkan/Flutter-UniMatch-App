import 'package:flutter/material.dart';
import 'package:unimatch/Entities/User.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

final MatchEngine matchEngine = new MatchEngine(
    matches: demoProfiles.map((User user) {
  return Match(user: user);
}).toList());

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ' UniMatch '),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: new CardStack(
          matchEngine: matchEngine,
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1),
    );
  }
}
