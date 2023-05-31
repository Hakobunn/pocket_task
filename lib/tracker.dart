import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pocket_task/util/habit_tile.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({Key? key}) : super(key: key);

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  List habitList = [
    //[habitName, habitStarted, timeSpent(sec), timeGoal(min)]
    ['Exercise', false,0,1],
    ['Study', false,0,20],
    ['Meditate', false,0,20],
    ['Code', false,0,40],
  ];

  void habitStarted(int index) {
    //note wht the start time is
    var startTime = DateTime.now();

    //include the time already elapsed
    int elapsedTime = habitList[index][2];

    //habit start or stop
    setState(() {
      habitList[index][1] =!habitList[index][1];
    });

    if (habitList[index][1]){
      //the timer
      Timer.periodic(const Duration(seconds:1), (timer){
        setState(() {
          //check when user stop the timer
          if (!habitList[index][1]) {
            timer.cancel();
          }

          //calculate the time elapsed by comparing current time and start time
          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime + currentTime.second - startTime.second +
              60* (currentTime.minute - startTime.minute) +
              60*60* (currentTime.hour - startTime.hour);
        });
      });
    }
  }
  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Settings for ' + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Consistency is key.'),
        centerTitle: false,
      ),
      body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: ((context, index) {
            return HabitTile(
              habitName: habitList [index][0],
              onTap: (){
                habitStarted(index);
              },
              settingsTapped: (){
                settingsOpened(index);
              },
              habitStarted: habitList[index][1],
              timeSpent: habitList[index][2],
              timeGoal: habitList [index][3],
              );
          }),
      ),
    );
  }
}
