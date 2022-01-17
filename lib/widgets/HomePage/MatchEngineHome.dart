import 'package:flutter/cupertino.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';

class MatchEngineHome extends StatelessWidget {
  const MatchEngineHome({
    Key? key,
    required this.matchEngine,
  }) : super(key: key);

  final MatchEngine matchEngine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: new CardStack(
        matchEngine: matchEngine,
      ),
    );
  }
}
