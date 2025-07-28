import 'package:flutter/material.dart';
import 'package:my_first_app/features/QuizApp/presentation/cubit/quizapp_cubit.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Text(
          "Score : ${QuizappCubit.score}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
