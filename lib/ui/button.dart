import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const Button({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: tdGreen.withOpacity(0.9),
          color: tdNavyBlue,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              //fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

