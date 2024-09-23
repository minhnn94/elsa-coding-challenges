// lib/leaderboard_screen.dart
import 'dart:math';

import 'package:elsa_coding_challenge/data/generate_data/generate_data.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/leader_board_component_cubit.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/widgets/leader_board_component_loading.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_component/widgets/question_component_countdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/leader_board_item.dart';

const maxOfLength = 3;

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leaderboard = UsersHelper().getUsers(3);
    leaderboard.sort(
        (a, b) => b.score.compareTo(a.score)); // Sort leaderboard by score
    return BlocBuilder<LeaderBoardComponentCubit, LeaderBoardComponentState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.users != current.users ||
          previous.myAccount != current.myAccount,
      builder: (context, state) {
        final myAccount = state.myAccount;

        if (state.isLoading) {
          return const LeaderBoardComponentLoading();
        } else {
          final data = state.users;
          return Row(
            children: [
              const QuestionComponentCountDownWidget(),
              Expanded(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: min(maxOfLength, data.length),
                      itemBuilder: (context, index) {
                        final user = data[index];
                        final isCurrentUser = user.id == myAccount.id;

                        return LeaderboardItem(
                          name: user.name,
                          position: index + 1,
                          score: user.score,
                          isCurrentUser: isCurrentUser,
                        );
                      },
                    ),
                    LeaderboardItem(
                      name: myAccount.name,
                      position: data.indexOf(myAccount) + 1,
                      score: myAccount.score,
                    )
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
