import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/core.dart';
import '../../app.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  void initState() {
    super.initState();
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
      body: FutureBuilder(
        future: loadRandomJsonElements(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var item = snapshot.data;
            return Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        itemCount: item!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          return QuestionsTile(
                            questuionNumber: index,
                            label: item[index]['question'],
                            itemCount: 4,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<dynamic> getAllQuestions() async {
    try {
      final jsonString = await rootBundle.loadString('assets/questions.json');
      final jsonMap = json.decode(jsonString);
      return jsonMap['questions'];
    } catch (e) {
      rethrow;
    }
  }

  List<dynamic> getRandomElements(List<dynamic> list, int n) {
    var random = Random();
    var length = list.length;
    if (length < n) {
      n = length;
    }
    for (var i = length - 1; i > length - 1 - n; i--) {
      var j = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;

      // Embaralhar as opções de resposta
      var options = ['optionA', 'optionB', 'optionC', 'optionD'];
      for (var option in options) {
        var k = random.nextInt(4);
        var optionTemp = list[i][option];
        list[i][option] = list[j][options[k]];
        list[j][options[k]] = optionTemp;
      }
    }
    return list.sublist(length - n);
  }

  Future<List<dynamic>> loadRandomJsonElements() async {
    List<dynamic> allData = await getAllQuestions();
    List<dynamic> randomData = getRandomElements(allData, 10);
    return randomData;
  }
}
