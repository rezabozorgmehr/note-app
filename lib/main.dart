import 'package:flutter/material.dart';
import 'package:flutter_note_app/add_task_screen.dart';
import 'package:flutter_note_app/car.dart';
import 'package:flutter_note_app/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'student.dart';
import 'task.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Car>('carBox');
  await Hive.openBox<Student>('studentBox');
  await Hive.openBox<Task>('taskBox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AddTaskScreen(),
    );
  }
}
