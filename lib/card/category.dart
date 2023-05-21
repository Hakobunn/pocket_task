import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final iconImagePath;
  final String categoryName;

  const CategoryCard({super.key,
    required this.iconImagePath,
    required this.categoryName,
});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20),
      child:Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: const Border(
            //bottom: BorderSide(color: Colors.black),
            //top: BorderSide(color: Colors.black),
            //left: BorderSide(color: Colors.black),
            //right: BorderSide(color: Colors.black),
          ),
          color: tdGrey.withOpacity(0.3),
        ),
        child: Row(
            children: [
            Image.asset(iconImagePath,
            height: 40),
        const SizedBox(
          width: 20,
        ),
        Text(categoryName),
        ],
      ),
      ),
    );
  }
}
