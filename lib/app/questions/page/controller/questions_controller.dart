import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';
import 'package:quiz_ufpr/app/questions/domain/usecase/questions_usecase.dart';

abstract class IQuestionsController extends Cubit {
  late QuestionsModel questionsModel = QuestionsModel();

  IQuestionsController(super.initialState);

  Future<QuestionsModel> random();
}

class QuestionsController extends IQuestionsController {
  final QuestionsUseCase useCase;

  QuestionsController({required this.useCase}) : super(null);

  @override
  Future<QuestionsModel> random() async {
    final result = useCase.call();
    return result;
  }
}
