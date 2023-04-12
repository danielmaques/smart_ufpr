import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';

import '../../domain/repository/questios_repository.dart';
import '../datasource/questions_datasorce.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsDataSorce datadource;

  QuestionsRepositoryImpl({required this.datadource});

  @override
  Future<List<QuestionsModel>> getQuestions() async {
    final result = await datadource.call();
    return result;
  }
}
