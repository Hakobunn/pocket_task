import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class InputField extends StatelessWidget {

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputField({Key? key,
  required this.title,
  required this.hint,
  this.controller,
  this.widget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.3
            ),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Expanded(child: TextFormField(
                readOnly: widget==null?false:true,
                autofocus: false,
                cursorColor: Colors.black,
                controller: controller,
                style: const TextStyle(
                  fontSize: 14,
                  color: tdBlack,
                  fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: tdBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w500
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tdBlack,
                      width: 0,
                    )
                  ),
                  enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: tdBlack,
                  width: 0,
                )
          )
                ),
              )),
              widget==null?Container(): Container(child: widget)
            ],
          ),
        )
      ],
    );
  }
}
