// lib/leaderboard_item.dart
import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final String name;
  final int score;
  final int position;
  final bool isCurrentUser;

  const LeaderboardItem({
    super.key,
    required this.name,
    required this.score,
    required this.position,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Position
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$position',
              style: TextStyle(
                color: isCurrentUser ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),

          // Name and Score
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isCurrentUser ? Colors.blue : Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Score: $score',
                style: TextStyle(
                  fontSize: 14,
                  color: isCurrentUser ? Colors.blue : Colors.grey.shade600,
                ),
              ),
            ],
          ),

          // Icon or Badge (Optional)
          if (isCurrentUser)
            Icon(
              Icons.star,
              color: Colors.yellow.shade700,
            ),
        ],
      ),
    );
  }
}
