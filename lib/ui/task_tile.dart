import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/controllers/task_controller.dart';
import 'package:pocket_task/models/task.dart';
import 'package:get/get.dart';
import 'package:pocket_task/ui/add_task.dart';


class TaskTile extends StatelessWidget {
  final Task? task;

  TaskTile({Key? key, required this.task}) : super(key: key);
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color ?? 0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title ?? "",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarms_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        task?.date ?? "", // Display the due date here
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[200], // Adjust the font color
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          task?.note ?? "",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTaskPage(
                                  task: task, isEditing: true),
                            ),
                          );
                        },
                      ),
                      if (task!.isCompleted == 0) // Only show if task is in To Do
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.black),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirmation'),
                                  content: const Text(
                                      'Are you sure you want to mark this task as completed?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _taskController.markTaskCompleted(task!.id!);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text(
                                    'Are you sure you want to delete this task?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _taskController.delete(task!);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.black,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task!.isCompleted == 1 ? 'COMPLETED' : 'TODO',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  _getBGClr(int no) {
    switch(no) {
      case 0:
        return tdLiteYellow;
      case 1:
        return tdLiteRed;
      case 2:
        return tdLiteGreen;
      case 3:
        return tdLiteBlue;
      case 4:
        return tdLitePurple;
      default:
        return tdLiteYellow;
    }
  }

