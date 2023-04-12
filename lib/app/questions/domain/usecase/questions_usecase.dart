import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';

import '../../data/datasource/questions_datasorce.dart';

abstract class QuestionsUseCase {
  Future<QuestionsModel> call();
}

class QuestionsUseCaseImpl extends QuestionsUseCase {
  final QuestionsDataSorce dataSource;

  QuestionsUseCaseImpl({required this.dataSource});

  @override
  Future<QuestionsModel> call() async {
    final result = await dataSource.getAllQuestions();
    return result;
  }
}
