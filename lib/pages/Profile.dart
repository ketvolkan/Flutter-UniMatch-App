import 'package:flutter/material.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ' UniMatch '),
      body: Container(margin: EdgeInsets.only(bottom: 0), child: ProfilePage()),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 0),
    );
  }
}
