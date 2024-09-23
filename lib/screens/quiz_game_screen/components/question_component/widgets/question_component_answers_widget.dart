import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_component_loading.dart';

class QuestionComponentAnswersWidget extends StatelessWidget {
  const QuestionComponentAnswersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionComponentCubit, QuestionComponentState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const QuestionComponentLoading();
        } else {
          final answers = state.answers;
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                _AnswersItem(answer: answers[index]),
            separatorBuilder: (_, __) => const SizedBox(
              height: 4,
            ),
            itemCount: answers.length,
          );
        }
      },
    );
  }
}

class _AnswersItem extends StatelessWidget {
  const _AnswersItem({super.key, required this.answer});

  final String answer;
  Color _getItemColor(String correctAnswer, String choiceAnswer) {
    if (choiceAnswer.isEmpty) {
      return Colors.white;
    } else {
      if (correctAnswer == answer) {
        return Colors.greenAccent;
      } else {
        if (answer == choiceAnswer) {
          return Colors.redAccent;
        } else {
          return Colors.white;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<QuestionComponentCubit, QuestionComponentState>(
        buildWhen: (previous, current) =>
            previous.choiceAnswer != current.choiceAnswer,
        builder: (context, state) {
          final correctAnswer = state.correctAnswer;
          final choiceAnswer = state.choiceAnswer;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _getItemColor(correctAnswer, choiceAnswer),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              context
                  .read<QuestionComponentCubit>()
                  .handleOnPressChoiceAnswer(answer);
            },
            child: Text(
              answer,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
