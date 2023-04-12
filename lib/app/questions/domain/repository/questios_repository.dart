import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';

abstract class QuestionsRepository {
  Future<List<QuestionsModel>> getQuestions();
}
