class Like {
  final int? id;
  final int? popularId;
  final int? likesId;
  Like({this.id, this.popularId, this.likesId});
  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      popularId: json['popularId'],
      likesId: json['likesId'],
    );
  }
}
