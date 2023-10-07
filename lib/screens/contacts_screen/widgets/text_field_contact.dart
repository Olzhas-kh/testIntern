import 'package:flutter/material.dart';
import 'package:test_intern/const/colors.dart';

class TextFieldContact extends StatelessWidget {
  final String textEditingController;
  final String labelText;
  const TextFieldContact({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: textEditingController),
      onChanged: (text) {},
      readOnly: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorProject.listTileColor.withOpacity(0.16),
                width: 1.0)),
        labelText: labelText,
        labelStyle: TextStyle(
            color: ColorProject.listTileColor.withOpacity(0.8),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
