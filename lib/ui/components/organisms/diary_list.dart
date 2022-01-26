import 'package:diary_sample/models/diary.dart';
import 'package:diary_sample/ui/common/diary.dart';
import 'package:diary_sample/ui/components/molecules/diary_item.dart';
import 'package:flutter/material.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({Key? key, required this.diaries, required this.onDiaryTab})
      : super(key: key);

  final List<Diary> diaries;
  final DiaryTab onDiaryTab;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: diaries.length,
        itemBuilder: (BuildContext context, int index) {
          final Diary diary = diaries[index];
          return GestureDetector(
            onTap: () => {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 15.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: MediaQuery.of(context).size.width * .9,
                    maxHeight: 280,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0.0,
                          top: 30.0,
                          //the center = (height of image container/2) - (height of this container/2)
                          child: DiaryItem(
                              diary: diary,
                              onTap: () {
                                onDiaryTab(diary);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
