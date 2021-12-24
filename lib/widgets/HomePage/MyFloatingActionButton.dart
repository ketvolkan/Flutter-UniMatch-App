import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      onPressed: () {},
      tooltip: 'Go Profile',
      child: const Icon(
        Icons.account_circle_rounded,
        color: Colors.amber,
      ),
    );
  }
}
