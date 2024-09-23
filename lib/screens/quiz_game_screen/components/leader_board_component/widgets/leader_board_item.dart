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
  Color getColorOfTop(int position, BuildContext context) {
    if (position == 1) {
      return const Color(0xFFFFD700);
    } else if (position == 2) {
      return const Color(0xFFC0C0C0);
    } else if (position == 3) {
      return const Color(0xFFCD7F32);
    } else {
      return Theme.of(context).colorScheme.inversePrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width / 2,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Position
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: getColorOfTop(position, context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: getColorOfTop(position, context), width: 4),
                    gradient: LinearGradient(colors: [
                      getColorOfTop(position, context).withOpacity(0.8),
                      getColorOfTop(position, context).withOpacity(0.3)
                    ])),
                child: Center(
                  child: Text(
                    '$position',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // Name and Score
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      softWrap: true, // Bật chế độ xuống dòng mềm mại
                      overflow: TextOverflow.visible,
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
                        color:
                            isCurrentUser ? Colors.blue : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // Icon or Badge (Optional)
              if (isCurrentUser)
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
