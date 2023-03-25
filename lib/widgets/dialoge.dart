// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CheckDialog extends StatelessWidget {
  const CheckDialog({
    Key? key,
    required this.onClick,
  }) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      //backgroundColor: Color.fromARGB(255, 122, 118, 118),
      icon: Icon(Icons.warning, color: Colors.red, size: 40),
      title: Text('Remove from paid'),
      content: Text('Do you wanna remove this from paid seat?'),
      actions: [
        TextButton(
          onPressed: () {
            onClick();
          },
          child: Text('remove'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('cancel'),
        ),
      ],
    );
  }
}
