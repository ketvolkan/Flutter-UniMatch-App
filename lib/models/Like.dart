import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/UserPhoto.dart';

class Like {
  Like({
    required this.id,
    required this.popularId,
    required this.likesId,
  });
  final int id;
  final int popularId;
  final int likesId;
}
