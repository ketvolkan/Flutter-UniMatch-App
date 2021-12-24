class Blocked {
  final int? id;
  final int? blockedId;
  final int? blockingId;
  final bool? active;
  Blocked({this.id, this.blockedId, this.blockingId, this.active});
  factory Blocked.fromJson(Map<String, dynamic> json) {
    return Blocked(
      id: json['id'],
      blockedId: json['blockedId'],
      blockingId: json['blockingId'],
      active: json['active'],
    );
  }
}
