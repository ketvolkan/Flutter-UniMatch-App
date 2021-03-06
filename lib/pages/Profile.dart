import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/utilities/functions.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/HomeProgress.dart';
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
  void initState() {
    super.initState();
  }

  List<User> profiles = [
    User(
        active: true,
        dateOfBirth: "",
        description: "description",
        firstName: "firstName",
        gender: "gender",
        id: 0,
        lastName: "lastName",
        mail: "mail",
        phoneNumber: "phoneNumber",
        verifiedAccount: true,
        password: "password",
        userPhotos: [])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: TitleText),
      body: FutureBuilder<dynamic>(
        future: SessionManager().get('id'),
        builder: (context, SnapshotId) {
          if (SnapshotId.hasData) {
            print(SnapshotId.data);
            return FutureBuilder<List<User>>(
              future: getAllUserById(id: SnapshotId.data),
              builder: (context, SnapshotUser) {
                if (SnapshotUser.hasData) {
                  print(SnapshotUser.data![0].firstName);
                  return FutureBuilder<List<UserPhoto>>(
                    future: getAllUserPhoto(),
                    builder: (context, SnapshotUserPhoto) {
                      if (SnapshotUserPhoto.hasData) {
                        profiles = ProfileAllProfilesMethod(
                            SnapshotUser, SnapshotUserPhoto);
                        return ProfilePage(profiles: profiles[0]);
                      } else
                        return HomeProgress(
                            text: PhotosLoading, color: Colors.blue);
                    },
                  );
                } else
                  return HomeProgress(text: AllUserLoading, color: Colors.blue);
              },
            );
          } else {
            return HomeProgress(text: SessionLoading, color: Colors.blue);
          }
        },
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 0),
    );
  }
}
