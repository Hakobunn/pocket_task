import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/services/notification_services.dart';
import 'package:pocket_task/ui/button.dart';
import 'package:pocket_task/ui/add_task.dart';
import 'package:pocket_task/services/theme_services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  dynamic notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.requestIOSPermissions();
  }
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      //backgroundColor: Colors.white,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _appBar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
        },
        child: const Icon(Icons.nightlight,
        size: 20,),
      ),
    );
  }

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
          _selectedDate =date;
        },
      ),
    );
  }

  _addTaskBar(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
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
            child: Button(label: "+ Add Task", onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTaskPage()),
               );
             },
            ),//Get.to(const AddTaskPage())),
          ),
        ],
      ),
    );
  }
}
