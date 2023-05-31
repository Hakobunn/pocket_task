import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_task/db/db_helper.dart';
import 'package:pocket_task/models/task.dart';

class TaskController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      update();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var taskList = <Task>[].obs;
  var todoTasks = <Task>[].obs;
  var completedTasks = <Task>[].obs;

  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    final taskId = await DBHelper.insert(task);
    getTasks();
    return taskId;
  }

  void getTasks() async {
    final tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
    categorizeTasks();
  }

  void categorizeTasks() {
    final todo = <Task>[];
    final completed = <Task>[];

    for (final task in taskList) {
      if (task.isCompleted == 1) {
        completed.add(task);
      } else {
        todo.add(task);
      }
    }

    todoTasks.assignAll(todo);
    completedTasks.assignAll(completed);
  }

  void delete(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    Task taskToUpdate = taskList.firstWhere((task) => task.id == id);
    taskToUpdate.isCompleted = 1;
    await DBHelper.update(taskToUpdate);
    getTasks();
  }

  void updateTask(Task task) async {
    await DBHelper.update(task);

    int index = taskList.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      taskList[index] = task;
    }

    index = todoTasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      todoTasks[index] = task;
    }

    index = completedTasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      completedTasks[index] = task;
    }

    getTasks(); // Refresh the task lists
  }
}
