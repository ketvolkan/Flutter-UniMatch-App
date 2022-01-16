import 'package:flutter/cupertino.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/services/DislikeService.dart';
import 'package:unimatch/services/LikeService.dart';

class Match extends ChangeNotifier {
  final User user;
  User currentUser;
  Decision decision = Decision.indecided;

  Match({required this.user, required this.currentUser});

  void like() async {
    if (decision == Decision.indecided) {
      decision = Decision.like;
      notifyListeners();
      print(currentUser.id);
      var response = await likeUser(currentUser, user);
    }
  }

  void nope() async {
    if (decision == Decision.indecided) {
      decision = Decision.nope;
      notifyListeners();
      var response = await dislikeUser(currentUser, user);
    }
  }

  void superLike() {
    if (decision == Decision.indecided) {
      decision = Decision.superLike;
      notifyListeners();
    }
  }

  void reset() {
    if (decision != Decision.indecided) {
      decision = Decision.indecided;
      notifyListeners();
    }
  }
}

enum Decision {
  indecided,
  nope,
  like,
  superLike,
}
