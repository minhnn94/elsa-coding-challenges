import 'package:elsa_coding_challenge/common/constants/sized_box_constants.dart';
import 'package:elsa_coding_challenge/shared_widgets/shimmer_custom.dart';
import 'package:flutter/material.dart';

class LeaderBoardComponentLoading extends StatelessWidget {
  const LeaderBoardComponentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ShimmerCustom(),
          ),
          SIZED_H16,
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ShimmerCustom(),
          ),
          SIZED_H16,
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ShimmerCustom(),
          ),
          SIZED_H16,
        ],
      ),
    );
  }
}
