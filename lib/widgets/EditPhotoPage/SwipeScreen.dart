import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/utilities/functions.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/HomePage/HomeProgress.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
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
List<Widget> widgets(List<String> _photos) {
  List<Widget> _widgets = [];
  for (var i = 0; i < _photos.length; i++) {
    Widget widget = GestureDetector(
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              _photos[i],
              fit: BoxFit.cover,
            )),
      ),
    );
    _widgets.add(widget);
  }
  return _widgets;
}

class _SwipeScreenState extends State<SwipeScreen> {
  String selectedPhoto = "";
  void changePhoto(String url) {
    setState(() {
      selectedPhoto = url;
      print(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: SessionManager().get('id'),
      builder: (context, SnapshotId) {
        if (SnapshotId.hasData) {
          print(SnapshotId.data);
          return FutureBuilder<List<User>>(
            future: getAllUserById(id: SnapshotId.data),
            builder: (context, SnapshotUser) {
              if (SnapshotUser.hasData) {
                return FutureBuilder<List<UserPhoto>>(
                  future: getAllUserPhoto(),
                  builder: (context, SnapshotUserPhoto) {
                    if (SnapshotUserPhoto.hasData) {
                      profiles = ProfileAllProfilesMethod(
                          SnapshotUser, SnapshotUserPhoto);
                      selectedPhoto = profiles.first.userPhotos.first;
                      return Container(
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new ExactAssetImage(selectedPhoto),
                            fit: BoxFit.none,
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 0),
                        child: BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 140,
                              ),
                              SwipeDeck(
                                  startIndex: 0,
                                  emptyIndicator: Container(
                                    child: Center(
                                      child: Text("Nothing Here"),
                                    ),
                                  ),
                                  cardSpreadInDegrees:
                                      1, // Change the Spread of Background Cards

                                  onChange: (index) {
                                    changePhoto(
                                        profiles.first.userPhotos[index]);
                                  },
                                  widgets: widgets(profiles.first.userPhotos)),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: 90,
                                    decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        gradient: new LinearGradient(colors: [
                                          Colors.yellowAccent,
                                          Colors.red
                                        ])),
                                    padding: const EdgeInsets.all(0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Sil",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: 90,
                                    decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        gradient: new LinearGradient(colors: [
                                          Colors.green,
                                          Colors.cyan
                                        ])),
                                    padding: const EdgeInsets.all(0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Değiştir",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
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
    );
  }
}
