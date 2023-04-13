// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_ufpr/app/questions/domain/usecase/questions_usecase.dart';
import 'package:quiz_ufpr/core/state/base_app_state.dart';

abstract class IQuestionsController extends Cubit<BaseState> {
  IQuestionsController() : super(const EmptyState());

  Future<void> random();
}

class QuestionsController extends IQuestionsController {
  final QuestionsUseCase useCase;

  QuestionsController(this.useCase);

  @override
  Future<void> random() async {
    emit(const LoadState());
    final result = await useCase.call();
    try {
      return emit(SuccessState(result));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
