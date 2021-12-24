class UserPhoto {
  final int? id;
  final int? userId;
  final String? photoUrl;
  final bool? active;

  UserPhoto({this.id, this.userId, this.photoUrl, this.active});
  factory UserPhoto.fromJson(Map<String, dynamic> json) {
    return UserPhoto(
      id: json['id'],
      userId: json['userId'],
      photoUrl: json['photoUrl'],
      active: json['active'],
    );
  }
}
