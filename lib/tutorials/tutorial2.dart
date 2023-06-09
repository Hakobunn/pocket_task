import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
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
                Text("Discover interesting Prophetic stories by accomplishing a set milestone of tasks.Claim an access to Prophetic stories at reward page",
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
                    image: AssetImage("assets/nerd.png"),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}