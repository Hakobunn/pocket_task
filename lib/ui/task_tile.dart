
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/models/task.dart';


class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color??0),
        ),
        child: Row(children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  task?.title??"",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
                ),
              ),
            const SizedBox(height: 5),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               /* Icon(
                    Icons.access_alarms_rounded,
                color: Colors.grey[200],
                size: 18,
                ),
                SizedBox(width: 4),*/
              ],
            ),
            const SizedBox(height: 10),
            Text(
              task?.note??"",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 14,
                  //color: Colors.grey[200],
                  color: Colors.black
                ),
              ),
            ),
            ],
          ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            //color: Colors.grey[200]!.withOpacity(0.7)
            color: Colors.black,
            ),
          RotatedBox(
              quarterTurns: 3,
            child: Text(
              task!.isCompleted ==1? "COMPLETED":"TODO",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
           ),
        ],),
      ),
    );
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
}
