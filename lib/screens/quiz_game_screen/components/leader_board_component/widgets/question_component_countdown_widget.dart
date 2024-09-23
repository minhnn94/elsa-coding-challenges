import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/question_component_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const durationTime = 15;

class QuestionComponentCountDownWidget extends StatefulWidget {
  const QuestionComponentCountDownWidget({super.key});

  @override
  State<QuestionComponentCountDownWidget> createState() =>
      _QuestionComponentCountDownWidgetState();
}

class _QuestionComponentCountDownWidgetState
    extends State<QuestionComponentCountDownWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: durationTime),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _timerString {
    Duration duration =
        _controller.duration! * _controller.value; // Remaining time
    return '${(durationTime - duration.inSeconds).toString().padLeft(2, '0')}s';
  }

  void _handleListenerChoiceAnswer(String choiceAnswer) {
    if (choiceAnswer == '') {
      _controller.reset();
      _controller.forward();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionComponentCubit, QuestionComponentState>(
      listenWhen: (previous, current) =>
          previous.choiceAnswer != current.choiceAnswer,
      listener: (context, state) {
        _handleListenerChoiceAnswer(state.choiceAnswer);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular Countdown Indicator
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: 1 - _controller.value,
                      strokeWidth: 8.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                  // Countdown Text
                  Text(
                    _timerString,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
