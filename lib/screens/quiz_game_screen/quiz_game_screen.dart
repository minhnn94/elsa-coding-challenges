import 'package:elsa_coding_challenge/common/constants/sized_box_constants.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/leader_board_component.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/leader_board_component_cubit.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component_cubit.dart';
import 'package:elsa_coding_challenge/shared_widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizGameScreen extends StatelessWidget {
  const QuizGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Quiz Game',
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LeaderBoardComponentCubit(),
          ),
          BlocProvider(
            create: (context) => QuestionComponentCubit(),
          ),
        ],
        child: const Column(children: [
          SIZED_H16,
          LeaderboardScreen(
            currentUser: User('Minh', 10, 100, ''),
          ),
          Expanded(child: QuestionScreen())
        ]),
      ),
    );
  }
}
