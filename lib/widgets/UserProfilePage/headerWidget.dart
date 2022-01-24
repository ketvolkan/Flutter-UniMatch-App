import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';

class headerWidget extends StatelessWidget {
  const headerWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(widget.profiles.userPhotos.first),
            fit: BoxFit.none,
          ),
        ),
        child: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(children: [
            SizedBox(
              height: 10.0,
            ),
            CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage(widget.profiles.userPhotos.first),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("${widget.profiles.firstName} ${widget.profiles.lastName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.profiles.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      ),
    );
  }
}
