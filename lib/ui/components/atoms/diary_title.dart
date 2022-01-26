import 'package:flutter/material.dart';

class DiaryTitle extends StatelessWidget {
  const DiaryTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }
}
