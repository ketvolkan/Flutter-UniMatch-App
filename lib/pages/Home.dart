import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/pages/Register.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

late final Future<List<User>> _users;
late final Future<List<UserPhoto>> _userPhotos;
int s = 0;
User? registered;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    if (s == 0) {
      _users = getAllUser();
      _userPhotos = getAllUserPhoto();
      s++;
    }
  }

  int id = 0;

  @override
  Widget build(BuildContext context) {
    List<User> getAllProfiles(profiles, photos, gender) {
      List<User> _profiles = profiles;
      List<UserPhoto> _photos = photos;
      for (var i = 0; i < _profiles.length; i++) {
        for (var h = 0; h < _photos.length; h++) {
          if (_profiles[i].id == _photos[h].userId) {
            _profiles[i].userPhotos.add(_photos[h].photoUrl);
          }
        }
        if (_profiles[i].userPhotos.length == 0) {
          _profiles[i].userPhotos.add("assets/placeholder_image.jpg");
        }
      }
      List<User> correctProfiles = [];
      for (var i = 0; i < _profiles.length; i++) {
        if (_profiles[i].id != id && _profiles[i].gender == gender) {
          correctProfiles.add(_profiles[i]);
        }
      }
      return correctProfiles;
    }

    return Scaffold(
      appBar: MyAppBar(title: ' UniMatch '),
      body: FutureBuilder<dynamic>(
        future: SessionManager().get('id'),
        builder: (context, snapshotId) {
          if (snapshotId.hasData) {
            return FutureBuilder<List<User>>(
                future: getAllUserById(id: snapshotId.data),
                builder: (context, registerdUser) {
                  if (registerdUser.hasData) {
                    registered = registerdUser.data!.first;
                    return FutureBuilder<List<User>>(
                        future: _users,
                        builder: (context, snapshotUser) {
                          if (snapshotUser.hasData) {
                            return FutureBuilder<List<UserPhoto>>(
                                future: _userPhotos,
                                // initialData : [],
                                builder: (context, snapshotPhotos) {
                                  if (snapshotPhotos.hasData) {
                                    String gender =
                                        registered!.gender == "E" ? "K" : "E";
                                    var profiles = getAllProfiles(
                                      snapshotUser.data,
                                      snapshotPhotos.data,
                                      gender,
                                    );
                                    final MatchEngine matchEngine =
                                        new MatchEngine(
                                            matches: (profiles as List<User>)
                                                .map((User user) {
                                      return Match(user: user);
                                    }).toList());
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: new CardStack(
                                        matchEngine: matchEngine,
                                      ),
                                    );
                                  } else if (snapshotPhotos.hasError) {
                                    return Center(
                                      child:
                                          Text(snapshotPhotos.error.toString()),
                                    );
                                  } else {
                                    return Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 280,
                                          ),
                                          CircularProgressIndicator(
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Photos Loading...",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                });
                          } else if (snapshotUser.hasError) {
                            return Center(
                              child: Text(snapshotUser.error.toString()),
                            );
                          } else {
                            return Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 280,
                                  ),
                                  CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "All User Loading...",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            );
                          }
                        });
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 280,
                          ),
                          CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                          Text(
                            "Registerd User Loading...",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    );
                  }
                });
          } else {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 280,
                  ),
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text(
                    "Session Loading...",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1),
    );
  }
}
