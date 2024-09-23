import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/widgets/question_tittle_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/question_component_answers_widget.dart';

class QuestionComponentScreen extends StatelessWidget {
  const QuestionComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionTitleWidget(),
            SizedBox(height: 20),
            Expanded(child: QuestionComponentAnswersWidget()),
          ],
        ));
  }
}
