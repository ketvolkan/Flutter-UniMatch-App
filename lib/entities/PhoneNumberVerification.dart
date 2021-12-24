class PhoneNumberVerification {
  final int? id;
  final int? userId;
  final bool? approved;
  final String? code;
  PhoneNumberVerification({this.id, this.userId, this.approved, this.code});
  factory PhoneNumberVerification.fromJson(Map<String, dynamic> json) {
    return PhoneNumberVerification(
      id: json['id'],
      userId: json['userId'],
      approved: json['approved'],
      code: json['code'],
    );
  }
}
