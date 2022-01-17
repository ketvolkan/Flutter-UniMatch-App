import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimatch/utilities/texts.dart';

class AllMatchFinished extends StatelessWidget {
  const AllMatchFinished({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 280,
          ),
          Icon(
            Icons.visibility_off_rounded,
            color: Colors.blue,
          ),
          Text(
            AllMatchFinishedText,
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
