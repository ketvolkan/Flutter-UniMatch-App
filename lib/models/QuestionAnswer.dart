class QuestionAnswer {
  final int? id;
  final int? questionId;
  final String? answer;
  QuestionAnswer({this.id, this.questionId, this.answer});
  factory QuestionAnswer.fromJson(Map<String, dynamic> json) {
    return QuestionAnswer(
      id: json['id'],
      questionId: json['questionId'],
      answer: json['answer'],
    );
  }
}
