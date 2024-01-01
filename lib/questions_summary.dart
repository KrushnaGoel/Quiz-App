import 'package:flutter/material.dart';
import 'package:quiznew/data/questions.dart';
import 'package:quiznew/questions_summary/question_identifier.dart';
import 'package:quiznew/questions_summary/summary_item.dart';
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
            return Row(
              children: [
                Expanded(
                  child: SummaryItem(data),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
