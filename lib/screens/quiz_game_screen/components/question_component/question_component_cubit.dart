import 'dart:math';

import 'package:elsa_coding_challenge/data/models/questions_model.dart';
import 'package:elsa_coding_challenge/data/repository/question_repository.dart';
import 'package:elsa_coding_challenge/shared_widgets/debug_log.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_component_state.dart';

class QuestionComponentCubit extends Cubit<QuestionComponentState> {
  QuestionComponentCubit() : super(const QuestionComponentState()) {
    initial();
  }
  void initial() {
    loadingQuestion();
  }

  final QuestionRepository _repository = QuestionRepository();
  Future<void> loadingQuestion() async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await _repository.getQuestion();
      _handleDataAfterGetQuestionsSuccess(result);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));

      debugLog(e.toString());
    }
  }

  void _handleDataAfterGetQuestionsSuccess(List<QuestionsModel> data) {
    final questionData = data.firstOrNull ?? QuestionsModel();
    final question = questionData.question?.text ?? "";
    final correctAnswer = questionData.correctAnswer ?? "";
    final incorrectAnswers = questionData.incorrectAnswers ?? [];
    final answers = [...incorrectAnswers, correctAnswer]..shuffle(Random());
    emit(state.copyWith(
      answers: answers,
      correctAnswer: correctAnswer,
      question: question,
    ));
  }

  Future<void> handleOnPressChoiceAnswer(String answer) async {
    if (state.choiceAnswer.isEmpty) {
      emit(state.copyWith(choiceAnswer: answer));
      onPostAnswer(answer == state.correctAnswer);
      await Future.delayed(const Duration(milliseconds: 3500));
      loadingNewQuestion();
    } else {
      return;
    }
  }

  Future<void> onPostAnswer(bool isCorrect) async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  void loadingNewQuestion() {
    resetData();
    loadingQuestion();
  }

  void resetData() {
    emit(const QuestionComponentState());
  }
}
