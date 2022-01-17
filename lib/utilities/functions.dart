import 'package:flutter/cupertino.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/widgets/HomePage/AllMatchFinished.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/Match.dart';
import 'package:unimatch/widgets/HomePage/MatchEngineHome.dart';

List<User> getAllProfiles(profiles, photos, gender, likes, dislikes, id) {
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
  bool like = false;
  bool dislike = false;
  for (var i = 0; i < _profiles.length; i++) {
    like = false;
    dislike = false;
    if (_profiles[i].id != id && _profiles[i].gender == gender) {
      for (var h = 0; h < likes.length; h++) {
        if (_profiles[i].id == likes[h].popularId) {
          like = true;
        }
      }
      for (var h = 0; h < dislikes.length; h++) {
        if (_profiles[i].id == dislikes[h].outOfFavorId) {
          dislike = true;
        }
      }
      if (!like && !dislike) {
        correctProfiles.add(_profiles[i]);
      }
    }
  }
  return correctProfiles;
}

Widget MatchEngineMethod(User registered, snapshotUser, snapshotPhotos,
    snapshotLike, snapshotDislike, id) {
  String gender = registered.gender == "E" ? "K" : "E";
  var profiles = getAllProfiles(
    snapshotUser.data,
    snapshotPhotos.data,
    gender,
    snapshotLike.data,
    snapshotDislike.data,
    id,
  );
  if (profiles.isNotEmpty) {
    final MatchEngine matchEngine = new MatchEngine(
        currentUser: registered,
        matches: (profiles as List<User>).map((User user) {
          return Match(user: user, currentUser: registered);
        }).toList());

    return MatchEngineHome(matchEngine: matchEngine);
  } else {
    return AllMatchFinished();
  }
}

List<User> ProfileAllProfilesMethod(AsyncSnapshot<List<User>> SnapshotUser,
    AsyncSnapshot<List<UserPhoto>> SnapshotUserPhoto) {
  var profiles = SnapshotUser.data!;
  List<UserPhoto> _photos = SnapshotUserPhoto.data!;
  for (var i = 0; i < profiles.length; i++) {
    for (var h = 0; h < _photos.length; h++) {
      if (profiles[i].id == _photos[h].userId) {
        profiles[i].userPhotos.add(_photos[h].photoUrl);
      }
    }
    if (profiles[i].userPhotos.length == 0) {
      profiles[i].userPhotos.add("assets/placeholder_image.jpg");
    }
  }
  return profiles;
}
