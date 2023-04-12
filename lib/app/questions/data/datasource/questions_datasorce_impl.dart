import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';

import 'questions_datasorce.dart';

class QuestionsDataSorceImpl implements QuestionsDataSorce {
  @override
  Future<List<QuestionsModel>> call() async {
    final jsonString = await rootBundle.loadString('assets/questions.json');
    final jsonList = json.decode(jsonString);
    return jsonList.map((json) => QuestionsModel.fromMap(json)).toList();
  }
}
