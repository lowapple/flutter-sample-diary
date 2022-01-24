import 'package:cached_network_image/cached_network_image.dart';
import 'package:diary_sample/models/diary.dart';
import 'package:diary_sample/view_model/base.dart';
import 'package:diary_sample/view_model/diary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDiary extends StatefulWidget {
  const ListDiary({Key? key}) : super(key: key);

  @override
  _ListDiaryState createState() => _ListDiaryState();
}

class _ListDiaryState extends State<ListDiary> {
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
        List<Diary> entries = model.diaries;
        if (model.viewStatus == ViewStatus.Loading) return LoadingView();
        if (entries.isEmpty) return const EmptyView();
        return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              final Diary entry = entries[index];
              final String heroTag = 'diary-image-${entry.id}';

              return GestureDetector(
                onTap: () => {},
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
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
                              child: Container(
                                width: 180,
                                height: 190,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        entry.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.event_note,
                                                  size: 18.0,
                                                  color: Color(0xFF3C4858),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    entry.createdAt,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xFF3C4858),
                                                        fontSize: 18.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.arrow_forward,
                                                  size: 26.0,
                                                  color: Colors.blueGrey,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

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

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF3C4858)),
          ),
        ),
        Text('Fetching your entries '),
      ],
    );
  }
}
