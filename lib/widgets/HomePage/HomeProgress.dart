import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProgress extends StatelessWidget {
  const HomeProgress({Key? key, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 280,
          ),
          CircularProgressIndicator(color: color),
          Text(
            text,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
