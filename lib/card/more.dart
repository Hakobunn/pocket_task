import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class More extends StatelessWidget {
  final String moreImagePath;
  final String moreName;

  const More({super.key,
    required this.moreImagePath,
    required this.moreName,
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 25),
    child: SizedBox(
      //height: 100,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: tdGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //icon
            Image.asset(
              moreImagePath,
              height: 50,
              width: 100,
            ),

            const SizedBox(
              height: 15,
            ),
            Text(moreName,
              style: const TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
