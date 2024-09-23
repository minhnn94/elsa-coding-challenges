import 'package:elsa_coding_challenge/screens/quiz_game_screen/components/question_component/widgets/question_tittle_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/question_component_answers_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedAnswer;

  final String question = "Câu hỏi: Thủ đô của Việt Nam là gì?";
  final List<String> answers = [
    "Hà Nội",
    "TP Hồ Chí Minh",
    "Đà Nẵng",
    "Hải Phòng",
  ];

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuestionTitleWidget(),
          SizedBox(height: 20),
          Expanded(child: QuestionComponentAnswersWidget()),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    return Text(
      question,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  List<Widget> _buildAnswerButtons() {
    return answers.map((answer) {
      final isSelected = selectedAnswer == answer;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.green : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () => selectAnswer(answer),
          child: Text(
            answer,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      );
    }).toList();
  }
}
