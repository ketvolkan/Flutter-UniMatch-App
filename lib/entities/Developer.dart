class Developer {
  final int? id;
  final String? mail;
  final String? password;
  final String? phoneNumber;
  Developer({this.id, this.mail, this.password, this.phoneNumber});
  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      id: json['id'],
      mail: json['mail'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
