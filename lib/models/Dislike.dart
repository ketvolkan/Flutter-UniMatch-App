import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/UserPhoto.dart';

class Dislike {
  Dislike({
    required this.id,
    required this.dislikeId,
    required this.outOfFavorId,
  });
  final int id;
  final int dislikeId;
  final int outOfFavorId;
}
