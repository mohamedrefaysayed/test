import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_first_app/features/QuizApp/presentation/cubit/quizapp_cubit.dart';
import 'package:my_first_app/features/QuizApp/presentation/pages/quiz.dart';
import 'package:my_first_app/product_card.dart';
import 'package:my_first_app/seetings_model.dart';
import 'package:my_first_app/features/todocubit/features/ToDo/presentation/cubit/todo_cubit.dart';
import 'package:my_first_app/features/todocubit/features/ToDo/presentation/pages/toddo_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Match your design mockup!
      minTextAdapt: true, // Optional: Auto-scale text
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => TodoCubit()),
              BlocProvider(create: (context) => QuizappCubit()),
            ],
            child: const Quiz(),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// This is the state for MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  List<SettingsModel> data = [
    SettingsModel(title: 'Family', icon: Icons.family_restroom_outlined),
    SettingsModel(title: 'Prefrences', icon: Icons.favorite),
    SettingsModel(
      title: 'Notifications',
      icon: Icons.notifications_active_rounded,
    ),
    SettingsModel(title: 'Health', icon: Icons.health_and_safety),
  ];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.orange.shade100,
              ),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => ProductCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
