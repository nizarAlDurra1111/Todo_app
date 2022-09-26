import 'package:flutter/material.dart';

Widget roundedTextField({
  String? hint,
  TextEditingController? controller,
  bool isMultiLine = false,
  TextInputType? textInputType = TextInputType.text,
  bool? isHidden = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
    child: TextFormField(
      focusNode: null,
      controller: controller,
      maxLines: isMultiLine ? 10 : 1,
      keyboardType: textInputType,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hint,
      ),
    ),
  );
}

Widget titleText(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 20),
  );
}

