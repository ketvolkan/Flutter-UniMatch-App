class Report {
  final int? id;
  final int? userId;
  final String? issue;
  Report({this.id, this.userId, this.issue});
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      userId: json['userId'],
      issue: json['issue'],
    );
  }
}
