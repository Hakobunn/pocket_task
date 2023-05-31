import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/controllers/task_controller.dart';
import 'package:pocket_task/models/task.dart';
import 'package:pocket_task/ui/button.dart';
import 'package:pocket_task/ui/input_field.dart';

class AddTaskPage extends StatefulWidget {
  final Task? task;
  final bool isEditing;

  const AddTaskPage({Key? key, this.task,this.isEditing = false}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
   final TaskController _taskController = Get.put(TaskController());
   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _noteController = TextEditingController();
   DateTime _selectedDate = DateTime.now();

   List<Color> circleAvatarColors = [
     tdLiteYellow,
     tdLiteRed,
     tdLiteGreen,
     tdLiteBlue,
     tdLitePurple,
   ];

   int _selectedColor=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              InputField(title: "Title", hint: "Enter your title",controller: _titleController),
              const SizedBox(height: 10),
              InputField(title: "Note", hint: "Enter your note", controller: _noteController),
              const SizedBox(height: 9),
              InputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined,
                  color: Colors.grey),
                  onPressed: () {
                    _getDateFromUser();
                  },

                ),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                ],
              ),
              const SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: SizedBox(
                  width: 150, // Adjust the width value as per your requirement
                  child: Button(
                    label: "Create Task",
                    onTap: ()=> _validateTask()),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

   _validateTask() {
     if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
       // Add code to save the task to the database
       _addTaskToDb();
       // Show success notification
       //_showNotification("Task created successfully");

       // Navigate back
       Get.back();
     } else {
       Get.snackbar(
         "Required",
         "The form is incomplete",
         snackPosition: SnackPosition.TOP,
         backgroundColor: Colors.white,
         colorText: tdBlack,
         icon: const Icon(Icons.warning_amber_rounded),
       );
     }
   }

  /* _showNotification(String message) {
     Get.snackbar(
       "Notification",
       message,
       snackPosition: SnackPosition.TOP,
       backgroundColor: Colors.white,
       colorText: tdBlack,
     );
   }*/

   _addTaskToDb() async {
    int value =await _taskController.addTask(
        task:Task(
          note: _noteController.text,
          title: _titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          color: _selectedColor,
          isCompleted: 0,
        )
    );
    print("My id is "+ "$value");
   }


   _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const Text("Color",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          children: List<Widget>.generate(
            5,
                (int index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedColor=index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: circleAvatarColors[index],
                    child: _selectedColor==index?
                    const Icon(Icons.done,
                        color: Colors.white,
                        size: 16):Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
   }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2124)
    );

    if(pickerDate!=null){
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
      });
    }else {
      print("something is wrong");
    }
  }
}
