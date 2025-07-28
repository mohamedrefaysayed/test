import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_first_app/features/QuizApp/data/models/question_model.dart';
import 'package:my_first_app/features/QuizApp/presentation/cubit/quizapp_cubit.dart';
import 'package:my_first_app/features/QuizApp/presentation/pages/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    super.initState();

    QuizappCubit.pageController = PageController(
      initialPage: QuizappCubit.currentIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: BlocConsumer<QuizappCubit, QuizappState>(
        listener: (context, state) {
          if (state == QuizappComplete()) {
            print("Completed");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: QuizappCubit.pageController,
                    itemBuilder: (context, questionIndex) {
                      final QuestionModel currentQuestion =
                          QuizappCubit.questions[questionIndex];
                      return ListView(
                        children: [
                          Center(
                            child: Text(
                              "${questionIndex + 1} / ${(QuizappCubit.questions.length).toString()}",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            currentQuestion.question,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(height: 30.h),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              currentQuestion.answers.length,
                              (int answersIndex) {
                                final String currentAnswer =
                                    currentQuestion.answers[answersIndex];
                                return InkWell(
                                  onTap: () {
                                    context.read<QuizappCubit>().selectOption(
                                      quesionID: currentQuestion.id,
                                      answer:
                                          currentQuestion.answers[answersIndex],
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(12.r),
                                      color:
                                          (QuizappCubit
                                                      .selectedAnswers[currentQuestion
                                                      .id] !=
                                                  null &&
                                              QuizappCubit
                                                      .selectedAnswers[currentQuestion
                                                      .id] ==
                                                  currentAnswer)
                                          ? Colors.grey
                                          : Colors.white,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                      horizontal: 24.w,
                                    ),

                                    child: Text(
                                      currentAnswer,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<QuizappCubit>().goBack();
                        },
                        child: Text("back"),
                      ),
                      QuizappCubit.currentIndex ==
                              QuizappCubit.questions.length - 1
                          ? ElevatedButton(
                              onPressed: () {
                                context.read<QuizappCubit>().calcScore();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Result(),
                                  ),
                                );
                              },
                              child: Text("submit"),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                context.read<QuizappCubit>().goNext();
                              },
                              child: Text("next"),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
