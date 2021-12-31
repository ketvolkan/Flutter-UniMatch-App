class Match {
  final int? id;
  final int? userId1;
  final int? userId2;
  final bool? active;
  Match({this.id, this.userId1, this.userId2, this.active});
  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      userId1: json['userId1'],
      userId2: json['userId2'],
      active: json['active'],
    );
  }
}
