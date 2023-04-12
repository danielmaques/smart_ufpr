import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz_ufpr/app/questions/data/datasource/questions_datasorce_impl.dart';
import 'package:quiz_ufpr/app/questions/domain/usecase/questions_usecase.dart';
import 'package:quiz_ufpr/app/questions/page/controller/questions_controller.dart';

import 'app/app.dart';
import 'app/questions/data/datasource/questions_datasorce.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<QuestionsDataSorce>((i) => QuestionsDataSorceImpl()),
        Bind.lazySingleton<QuestionsUseCase>(
            (i) => QuestionsUseCaseImpl(dataSource: i())),
        Bind.lazySingleton<IQuestionsController>(
            (i) => QuestionsController(useCase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/questionsPage', child: (context, args) => const QuestionsPage())
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UFPR Smart',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
