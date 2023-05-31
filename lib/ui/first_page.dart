import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/controllers/task_controller.dart';
import 'package:pocket_task/models/task.dart';
import 'package:pocket_task/services/notification_services.dart';
import 'package:pocket_task/ui/button.dart';
import 'package:pocket_task/ui/add_task.dart';
import 'package:pocket_task/services/theme_services.dart';
import 'package:pocket_task/ui/task_tile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //dynamic notifyHelper;
  NotifyHelper notifyHelper = NotifyHelper();

  @override
  void initState() {
    super.initState();
    notifyHelper.initialiseNotifications();
  }

  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: _appBar(
        "Theme Changed",
        Get.isDarkMode ? "Activated Dark Theme" : "Activated Light Theme",
      ),
      //backgroundColor: Colors.white,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(height: 20),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index){

            Task task = _taskController.taskList[index];
            //print(task.toJson());
            if(task.date==DateFormat.yMd().format(_selectedDate)){
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                                _showBottomSheet(context,task);
                              },
                              child: TaskTile(task: task)
                          ),
                        ],
                      ),
                    ),
                  ));
            }else{
              return Container();
            }

          },
        );
      }),
    );
  }

  AppBar _appBar(String title, String body) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.sendNotification(
            title,
            body,
          );
        },
        child: Icon(Get.isDarkMode ?Icons.wb_sunny_rounded:
          Icons.nightlight,
          size: 20,
          color: Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, Task task){
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.only(top: 4),
          height: task.isCompleted==1?
              MediaQuery.of(context).size.height*0.24:
              MediaQuery.of(context).size.height*0.32,
              color: Get.isDarkMode?tdBlack:Colors.white,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode?Colors.grey[600]:Colors.blue[400],
                ),
              ),
              const Spacer(),
              task.isCompleted==1?
                  Container()
                    : _bottomSheetButton(
                    label: "Task Completed",
                    onTap: (){
                      _taskController.markTaskCompleted(task.id!);
                      Get.back();
                    },
                    clr: tdNavyBlue,
                    context: context,
                  ),
              //const SizedBox(height: 5,),
              _bottomSheetButton(
                label: "Delete Task",
                onTap: (){
                  _taskController.delete(task);
                  Get.back();
                },
                clr: Colors.black,
                context: context,
              ),
              const SizedBox(height: 15,),
              _bottomSheetButton(
                label: "Close",
                onTap: (){
                  Get.back();
                },
                clr: Colors.blueGrey,
                isClose: true,
                context: context,
              ),
              const SizedBox(height: 15,),
            ],
          ),
        )
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose=false,
    required BuildContext context,
}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 45,
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose==true?Get.isDarkMode?Colors.grey[600]!:
            Colors.grey:clr
          ),
          borderRadius: BorderRadius.circular(50),
          color: isClose==true?Colors.transparent:clr,
        ),

        child: Center(
          child: Text(
            label,
            style: isClose? taskTextStyle:taskTextStyle.copyWith(
                color:Colors.white),
          ),
        ),
      ),
    );
  }

       // Define the dateTextStyle
       final TextStyle taskTextStyle = const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Colors.black,
       );

  _addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        //selectionColor: tdGreen.withOpacity(0.9),
        selectionColor: tdNavyBlue,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date){
          setState(() {
            _selectedDate=date;
          });
        },
      ),
    );
  }

  _addTaskBar(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 8),
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 170),
          Expanded(
            child: Button(label: "+ Add Task", onTap: () async {
              await Get.to(()=> const AddTaskPage(task: null));
              _taskController.getTasks();
             },
            ),//Get.to(const AddTaskPage())),
          ),
        ],
      ),
    );
  }
}
