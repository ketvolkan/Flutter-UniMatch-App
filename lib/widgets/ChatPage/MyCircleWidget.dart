import 'package:flutter/material.dart';

class MyCircleWidget extends StatelessWidget {
  final String _url;
  const MyCircleWidget(
    this._url, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: Container(
        width: 50,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(_url, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
