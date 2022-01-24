import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/pages/Profile.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/UserProfilePage/headerWidget.dart';
import 'package:unimatch/widgets/UserProfilePage/scrollWidget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.profiles}) : super(key: key);
  User profiles;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        child: Stack(
          children: [
            Column(
              children: [
                headerWidget(widget: widget),
                scrollWidget(widget: widget)
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
