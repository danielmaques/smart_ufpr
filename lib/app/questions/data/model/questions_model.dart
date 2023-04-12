class QuestionsModel {
  QuestionsModel({this.questions = const []});

  final List<Question> questions;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    final questionsList = json['questions'] as List<dynamic>;
    final questions =
        questionsList.map((questionJson) => Question.fromJson(questionJson)).toList();
    return QuestionsModel(questions: questions);
  }

  Map<String, dynamic> toJson() =>
      {'questions': questions.map((q) => q.toJson()).toList()};
}

class Question {
  Question({
    this.optionA = '',
    this.optionB = '',
    this.optionC = '',
    this.optionD = '',
    this.questionText = '',
  });

  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String questionText;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      optionA: json['optionA'] ?? '',
      optionB: json['optionB'] ?? '',
      optionC: json['optionC'] ?? '',
      optionD: json['optionD'] ?? '',
      questionText: json['questionText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'questionText': questionText,
    };
  }
}
