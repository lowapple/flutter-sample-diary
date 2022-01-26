import 'package:diary_sample/models/diary.dart';
import 'package:diary_sample/ui/components/atoms/diary_date.dart';
import 'package:diary_sample/ui/components/atoms/diary_title.dart';
import 'package:diary_sample/ui/components/atoms/icon/icon_arrow_right.dart';
import 'package:flutter/material.dart';

class DiaryItem extends StatelessWidget {
  const DiaryItem({Key? key, required this.diary, this.onTap})
      : super(key: key);

  final Diary diary;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 190,
          height: 190,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                DiaryTitle(title: diary.title),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      DiaryDate(date: diary.createdAt),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[IconArrowRight()],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
