class UserQuestion {
  final int? id;
  final String? question;

  UserQuestion({
    this.id,
    this.question,
  });
  factory UserQuestion.fromJson(Map<String, dynamic> json) {
    return UserQuestion(
      id: json['id'],
      question: json['question'],
    );
  }
}
