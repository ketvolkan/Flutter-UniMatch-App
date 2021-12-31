class MailVerification {
  final int? id;
  final int? userId;
  final bool? approved;
  final String? code;
  MailVerification({this.id, this.userId, this.approved, this.code});
  factory MailVerification.fromJson(Map<String, dynamic> json) {
    return MailVerification(
      id: json['id'],
      userId: json['userId'],
      approved: json['approved'],
      code: json['code'],
    );
  }
}
