import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/features/QuizApp/data/models/question_model.dart';

part 'quizapp_state.dart';

class QuizappCubit extends Cubit<QuizappState> {
  QuizappCubit() : super(QuizappInitial());

  static final List<QuestionModel> questions = [
    QuestionModel(
      id: 1,
      question: "What is the capital of France?",
      answers: ["London", "Berlin", "Paris", "Madrid"],
      correctAnswer: "Paris",
    ),
    QuestionModel(
      id: 2,
      question: "Which planet is known as the Red Planet?",
      answers: ["Venus", "Mars", "Jupiter", "Saturn"],
      correctAnswer: "Mars",
    ),
    QuestionModel(
      id: 3,
      question: "What is the largest mammal in the world?",
      answers: ["Elephant", "Blue Whale", "Giraffe", "Polar Bear"],
      correctAnswer: "Blue Whale",
    ),
    QuestionModel(
      id: 4,
      question: "In which year did World War II end?",
      answers: ["1943", "1945", "1950", "1939"],
      correctAnswer: "1945",
    ),
    QuestionModel(
      id: 5,
      question: "Who painted the Mona Lisa?",
      answers: [
        "Vincent van Gogh",
        "Pablo Picasso",
        "Leonardo da Vinci",
        "Michelangelo",
      ],
      correctAnswer: "Leonardo da Vinci",
    ),
    QuestionModel(
      id: 6,
      question: "What is the chemical symbol for gold?",
      answers: ["Go", "Gd", "Au", "Ag"],
      correctAnswer: "Au",
    ),
    QuestionModel(
      id: 7,
      question: "Which language is used to build Flutter apps?",
      answers: ["Java", "Dart", "Python", "Swift"],
      correctAnswer: "Dart",
    ),
  ];

  static Map<int, String> selectedAnswers = {};

  static int currentIndex = 0;

  static PageController pageController = PageController();

  static int score = 0;

  void selectOption({required int quesionID, required String answer}) {
    selectedAnswers[quesionID] = answer;
    emit(QuizappUpdate());
  }

  void goNext() {
    currentIndex++;
    pageController.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    emit(QuizappUpdate());
  }

  void goBack() {
    currentIndex--;
    pageController.previousPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    emit(QuizappUpdate());
  }

  void calcScore() {
    for (var question in questions) {
      if (question.correctAnswer == selectedAnswers[question.id]) {
        score++;
      }
    }
    emit(QuizappUpdate());
  }

  void updateState() {
    emit(QuizappUpdate());
  }
}
