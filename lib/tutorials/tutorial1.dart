import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      //color: Colors.white,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Column(
                children: <Widget>[
                 const Text(
                   "Tutorial",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
               ),
        ),
                      const SizedBox(
                height: 20,
              ),
              Text("Customize contents by adding new tasks to the checklist. Simply click Add at the right side menu to add new tasks.",
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.grey[700],
                      fontSize: 15,
                    )
              )
          ],
        ),
               Container(
                 height: MediaQuery.of(context).size.height/2.5,
                 decoration: const BoxDecoration(
                 image: DecorationImage(
                 image: AssetImage("assets/takingnote.png"),
               )
        ),
      ),
      ],
    ),
    ),
    );
  }
}