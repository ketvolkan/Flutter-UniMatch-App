class UserAnswer {
  final int? id;
  final int? userId;
  final int? answerId;
  UserAnswer({this.id, this.userId, this.answerId});
  factory UserAnswer.fromJson(Map<String, dynamic> json) {
    return UserAnswer(
      id: json['id'],
      userId: json['userId'],
      answerId: json['answerId'],
    );
  }
}
