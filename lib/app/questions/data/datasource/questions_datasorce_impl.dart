import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_ufpr/app/questions/data/model/questions_model.dart';

import 'questions_datasorce.dart';

class QuestionsDataSorceImpl implements QuestionsDataSorce {
  @override
  Future<QuestionsModel> getAllQuestions() async {
    try {
      final jsonString = await rootBundle.loadString('assets/questions.json');
      final jsonMap = json.decode(jsonString);
      return QuestionsModel.fromJson(jsonMap);
    } catch (e) {
      rethrow;
    }
  }
}
