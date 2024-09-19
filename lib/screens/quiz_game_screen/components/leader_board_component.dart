// lib/leaderboard_screen.dart
import 'dart:math';

import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/leader_board_item.dart';
import 'package:flutter/material.dart';

const maxOfLength = 3;

class LeaderboardScreen extends StatelessWidget {
  final User currentUser;

  const LeaderboardScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final leaderboard = getLeaderboard();
    leaderboard.sort(
        (a, b) => b.score.compareTo(a.score)); // Sort leaderboard by score

    final position = leaderboard.indexOf(currentUser) + 1;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: min(maxOfLength, leaderboard.length),
      itemBuilder: (context, index) {
        final user = leaderboard[index];
        final isCurrentUser = user.name == currentUser.name;

        return LeaderboardItem(
          name: user.name,
          position: user.position,
          score: user.score,
        );
      },
    );
  }
}
