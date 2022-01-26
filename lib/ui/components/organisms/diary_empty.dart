import 'package:flutter/material.dart';

class DiaryEmpty extends StatelessWidget {
  const DiaryEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 15.0),
          child: const Text(
            '0개의 일기가 검색되었습니다',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('데이터가 없습니다'),
        )
      ],
    );
  }
}
