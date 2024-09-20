import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/leader_board_component.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component.dart';
import 'package:flutter/material.dart';

class QuizGameScreen extends StatelessWidget {
  const QuizGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        LeaderboardScreen(
          currentUser: User('Minh', 10, 100),
        ),
        const Expanded(child: QuestionScreen())
      ]),
    );
  }
}
