class QuestionsModel {
  QuestionsModel({
    required this.questions,
  });

  final List<Question> questions;

  factory QuestionsModel.fromMap(Map<String, dynamic> json) => QuestionsModel(
        questions: List<Question>.from(json["questions"].map((x) => Question.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toMap())),
      };
}

class Question {
  Question({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.question,
  });

  final String a;
  final String b;
  final String c;
  final String d;
  final String question;

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        question: json["question"],
      );

  Map<String, dynamic> toMap() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "question": question,
      };
}
