import '../model/questions_model.dart';

abstract class QuestionsDataSorce {
  Future<QuestionsModel> getAllQuestions();
}
