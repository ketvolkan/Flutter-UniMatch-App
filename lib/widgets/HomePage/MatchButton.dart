import 'package:flutter/material.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/HomePage/Match.dart';

class MatchButton extends StatelessWidget {
  MatchButton({Key? key, required this.currentMatch}) : super(key: key);
  Match currentMatch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: [
              Text(
                DislikeText,
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  currentMatch.nope();
                },
                icon: Icon(Icons.cancel_outlined),
                color: Colors.white,
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  currentMatch.like();
                },
                icon: Icon(Icons.favorite),
                color: Colors.red,
              ),
              Text(
                LikeText,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
