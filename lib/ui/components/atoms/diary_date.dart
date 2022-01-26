import 'package:flutter/material.dart';

class DiaryDate extends StatelessWidget {
  const DiaryDate({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.event_note,
          size: 18.0,
          color: Color(0xFF3C4858),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date,
            style: const TextStyle(color: Color(0xFF3C4858), fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
