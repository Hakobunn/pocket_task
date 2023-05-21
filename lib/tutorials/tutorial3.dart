import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                Text("Lighten your spirit by reading motivational quotes. Click Quotes in Dashboard to access the quotes page.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    )
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/time.png"),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}