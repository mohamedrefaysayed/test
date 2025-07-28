// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  int id;
  String question;
  List<String> answers;
  String correctAnswer;
  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
