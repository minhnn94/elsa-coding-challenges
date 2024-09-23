import 'package:elsa_coding_challenge/common/constants/sized_box_constants.dart';
import 'package:elsa_coding_challenge/shared_widgets/shimmer_custom.dart';
import 'package:flutter/material.dart';

class QuestionComponentLoading extends StatelessWidget {
  const QuestionComponentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
