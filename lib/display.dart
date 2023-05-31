import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_task/controllers/task_controller.dart';
import 'package:pocket_task/models/task.dart';
import 'package:pocket_task/ui/task_tile.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Tasks'),
        bottom: TabBar(
          controller: _taskController.tabController,
          tabs: const [
            Tab(
              child: Text(
                'To Do',
                style: TextStyle(
                  fontSize: 16, // Adjust the font size
                  fontWeight: FontWeight.bold, // Adjust the font weight
                  color: Colors.black, // Adjust the font color
                ),
              ),
            ),
            Tab(
              child: Text(
                'Completed',
                style: TextStyle(
                  fontSize: 16, // Adjust the font size
                  fontWeight: FontWeight.bold, // Adjust the font weight
                  color: Colors.black, // Adjust the font color
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TabBarView(
          controller: _taskController.tabController,
          children: [
            _buildTaskList(_taskController.todoTasks),
            _buildTaskList(_taskController.completedTasks),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task: task);
      },
    );
  }
}
