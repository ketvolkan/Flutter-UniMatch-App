class Dislike {
  final int? id;
  final int? dislikeId;
  final int? outOfFavorId;
  Dislike({this.id, this.dislikeId, this.outOfFavorId});
  factory Dislike.fromJson(Map<String, dynamic> json) {
    return Dislike(
      id: json['id'],
      dislikeId: json['dislikeId'],
      outOfFavorId: json['outOfFavorId'],
    );
  }
}
