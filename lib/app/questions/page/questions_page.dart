import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../../app.dart';
import 'controller/questions_controller.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late IQuestionsController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get();
    controller.random();
    controller.questionsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLACK19,
      appBar: AppBar(
        backgroundColor: AppColors.BLACK1F,
        centerTitle: false,
        title: const Text('Questions'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  itemCount: controller.questionsModel.questions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemBuilder: (context, index) {
                    return QuestionsTile(
                      questuionNumber: index,
                      label: controller.questionsModel.questions[index].questionText,
                      question:
                          'iebkejsndkjbekrbcekjwvbhfej wekjf cwkejhfdbsckeubdfcwkhje fdkhwefkjhwjkfhkwhefkg',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
