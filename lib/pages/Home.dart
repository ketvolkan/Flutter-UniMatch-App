import 'package:flutter/material.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
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

  @override
  Widget build(BuildContext context) {
    List<User> getAllProfiles(profiles, photos) {
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

      return _profiles;
    }

    return Scaffold(
      appBar: MyAppBar(title: ' UniMatch '),
      body: FutureBuilder<List<User>>(
          future: _users,
          builder: (context, snapshotUser) {
            if (snapshotUser.hasData) {
              return FutureBuilder<List<UserPhoto>>(
                  future: _userPhotos,
                  // initialData : [],
                  builder: (context, snapshotPhotos) {
                    if (snapshotPhotos.hasData) {
                      var profiles = getAllProfiles(
                          snapshotUser.data, snapshotPhotos.data);
                      final MatchEngine matchEngine = new MatchEngine(
                          matches: (profiles as List<User>).map((User user) {
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
                        child: Text(snapshotPhotos.error.toString()),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            } else if (snapshotUser.hasError) {
              return Center(
                child: Text(snapshotUser.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1),
    );
  }
}
