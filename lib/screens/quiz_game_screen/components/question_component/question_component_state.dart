part of 'question_component_cubit.dart';

class QuestionComponentState extends Equatable {
  final QuestionsModel? questionsModel;
  final bool isLoading;
  final String question;
  final String choiceAnswer;
  final String correctAnswer;
  final List<String> answers;

  const QuestionComponentState({
    this.questionsModel,
    this.question = '',
    this.isLoading = false,
    this.choiceAnswer = '',
    this.correctAnswer = '',
    this.answers = const [],
  });

  // copyWith function to create a new instance with modified values
  QuestionComponentState copyWith({
    QuestionsModel? questionsModel,
    bool? isLoading,
    String? choiceAnswer,
    String? correctAnswer,
    String? question,
    List<String>? answers,
  }) {
    return QuestionComponentState(
      questionsModel: questionsModel ?? this.questionsModel,
      isLoading: isLoading ?? this.isLoading,
      choiceAnswer: choiceAnswer ?? this.choiceAnswer,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      answers: answers ?? this.answers,
      question: question ?? this.question,
    );
  }

  @override
  List<Object?> get props => [
        questionsModel,
        isLoading,
        choiceAnswer,
        correctAnswer,
        answers,
      ];
}
