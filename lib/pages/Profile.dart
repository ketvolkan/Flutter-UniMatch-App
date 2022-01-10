import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';
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
      appBar: MyAppBar(title: ' UniMatch '),
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
                        print(SnapshotUserPhoto.data![0].photoUrl);
                        profiles = SnapshotUser.data!;

                        List<UserPhoto> _photos = SnapshotUserPhoto.data!;
                        for (var i = 0; i < profiles.length; i++) {
                          for (var h = 0; h < _photos.length; h++) {
                            if (profiles[i].id == _photos[h].userId) {
                              profiles[i].userPhotos.add(_photos[h].photoUrl);
                            }
                          }
                          if (profiles[i].userPhotos.length == 0) {
                            profiles[i]
                                .userPhotos
                                .add("assets/placeholder_image.jpg");
                          }
                        }
                        print(profiles[0].firstName);

                        return ProfilePage(profiles: profiles[0]);
                      } else
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                    },
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 0),
    );
  }
}
