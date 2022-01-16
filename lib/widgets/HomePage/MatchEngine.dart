import 'package:flutter/widgets.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/services/DislikeService.dart';
import 'package:unimatch/services/LikeService.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/widgets/HomePage/Match.dart';

class MatchEngine extends ChangeNotifier {
  final List<Match> _matches;
  int? _currrentMatchIndex;
  int? _nextMatchIndex;
  final User currentUser;
  int matchCount = 0;

  MatchEngine({required List<Match> matches, required this.currentUser})
      : _matches = matches {
    _currrentMatchIndex = 0;
    _nextMatchIndex = 1;
  }

  Match get currentMatch => _matches[_currrentMatchIndex!];
  Match get nextMatch => _matches[_nextMatchIndex!];
  int? get matchC => matchCount;
  int? get count => _matches.length;
  void cycleMatch() {
    if (currentMatch.decision != Decision.indecided) {
      currentMatch.reset();
      _currrentMatchIndex = _nextMatchIndex;

      _nextMatchIndex =
          _nextMatchIndex! < _matches.length - 1 ? _nextMatchIndex! + 1 : 0;

      notifyListeners();
    }
  }

  void MatchCountPlus() {
    matchCount++;
  }
}
