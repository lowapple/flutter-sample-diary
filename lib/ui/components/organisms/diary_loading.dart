import 'package:flutter/material.dart';

class DiaryLoading extends StatelessWidget {
  const DiaryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF3C4858)),
          ),
        ),
        const Text('일기 불러오는 중'),
      ],
    );
  }
}
