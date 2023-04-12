import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';
import 'package:quiz_ufpr/app/questions/domain/repository/questios_repository.dart';

abstract class QuestionsUseCase {
  Future<List<QuestionsModel>> call();
}

class QuestionsUseCaseImpl extends QuestionsUseCase {
  final QuestionsRepository repository;

  QuestionsUseCaseImpl({required this.repository});

  @override
  Future<List<QuestionsModel>> call() async {
    final result = await repository.getQuestions();
    return result;
  }
}
