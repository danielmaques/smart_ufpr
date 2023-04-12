import 'package:flutter/material.dart';
import 'package:quiz_ufpr/core/style/app_colors.dart';

class QuestionsTile extends StatefulWidget {
  const QuestionsTile({
    super.key,
    required this.questuionNumber,
    required this.label,
    required this.question,
  });

  final int questuionNumber;
  final String label;
  final String question;

  @override
  State<QuestionsTile> createState() => _QuestionsTileState();
}

class _QuestionsTileState extends State<QuestionsTile> {
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(4, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.BLACK1F,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Questão ${widget.questuionNumber} - ${widget.label}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   separatorBuilder: (context, index) {
          //     return const SizedBox(height: 10);
          //   },
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     return options(index: index);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget options({required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _isChecked[index],
          onChanged: (value) {
            setState(() {
              _isChecked[index] = value!;
            });
          },
        ),
        Flexible(
          child: Text(
            widget.question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
