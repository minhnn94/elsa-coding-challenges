import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionTitleWidget extends StatelessWidget {
  const QuestionTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionComponentCubit, QuestionComponentState>(
      buildWhen: (previous, current) => previous.question != current.question,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
