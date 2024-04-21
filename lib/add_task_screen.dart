import 'package:flutter/material.dart';
import 'package:flutter_note_app/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();

  final box = Hive.box<Task>('taskBox');

  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: negahban1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 20,
                      color: negahban1.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskSubTitle,
                  maxLines: 2,
                  focusNode: negahban2,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 20,
                      color: negahban1.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                String taskTitle = controllerTaskTitle.text;
                String taskSubTitle = controllerTaskSubTitle.text;
                addTask(taskTitle, taskSubTitle);
              },
              child: Text(
                'اضافه کردن تسک',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff18DAA3),
                minimumSize: Size(
                  200,
                  40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(title: taskTitle, subTitle: taskSubTitle);
    box.add(task);
  }
}
