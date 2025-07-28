part of 'quizapp_cubit.dart';

abstract class QuizappState {
  const QuizappState();

  @override
  List<Object> get props => [];
}

class QuizappInitial extends QuizappState {}

class QuizappUpdate extends QuizappState {}

class QuizappComplete extends QuizappState {}
