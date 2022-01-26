import 'package:diary_sample/models/diary.dart';
import 'package:diary_sample/ui/components/organisms/diary_empty.dart';
import 'package:diary_sample/ui/components/organisms/diary_list.dart';
import 'package:diary_sample/ui/components/organisms/diary_loading.dart';
import 'package:diary_sample/ui/pages/page_diary_view.dart';
import 'package:diary_sample/view_model/base.dart';
import 'package:diary_sample/view_model/diary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageDiaryList extends StatefulWidget {
  static const routeName = 'page-diary-list';

  const PageDiaryList({Key? key}) : super(key: key);

  @override
  _PageDiaryListState createState() => _PageDiaryListState();
}

class _PageDiaryListState extends State<PageDiaryList> {
  DiaryViewModel? diaryViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final entryViewModel = Provider.of<DiaryViewModel>(context);
    if (diaryViewModel != entryViewModel) {
      diaryViewModel = entryViewModel;
      Future.microtask(entryViewModel.getDiaries);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DiaryViewModel>(builder: (context, model, child) {
        // 일기 상태에 따라 화면을 변경한다.
        List<Diary> entries = model.diaries;
        // 로딩중
        if (model.viewStatus == ViewStatus.Loading) return DiaryLoading();
        // 일기 없음
        if (entries.isEmpty) return const DiaryEmpty();
        // 일기 있음
        return DiaryList(
            diaries: entries,
            onDiaryTab: (Diary diary) {
              Navigator.of(context)
                  .pushNamed(PageDiaryView.routeName, arguments: diary);
            });
      }),
    );
  }
}
