import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';
import 'package:quiz_ufpr/app/questions/domain/usecase/questions_usecase.dart';

abstract class IQuestionsController {
  IQuestionsController() : super();
  late QuestionsModel questionsModel;

  Future<List<QuestionsModel>> random();
}

class QuestionsController extends IQuestionsController {
  final QuestionsUseCase useCase;

  QuestionsController({required this.useCase});

  @override
  Future<List<QuestionsModel>> random() async {
    final result = useCase.call();
    return result;
  }
}
