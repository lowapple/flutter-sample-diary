import 'package:diary_sample/models/diary.dart';
import 'package:diary_sample/services/diary_local_storage.dart';
import 'package:diary_sample/view_model/base.dart';

class DiaryViewModel extends BaseViewModel {
  List<Diary> _diaries = [];
  late String _message;

  String get message => _message;

  List<Diary> get diaries => _diaries;

  late DiaryLocalStorage _diaryLocalStorage;

  Future<void> getDiaries() async {
    _diaryLocalStorage = DiaryLocalStorage();
    setStatus(ViewStatus.Loading);
    _message = '';
    try {
      _diaries = await _diaryLocalStorage.diaries();
    } on Error catch (e) {
      print(e);
      await _diaryLocalStorage.clear();
    }
    _diaries.add(Diary(0, "테스트 데이터", "내용", "ASD", "2022-01-10"));
    setStatus(ViewStatus.Ready);
  }

  Future<void> create(Map<String, dynamic> formData) async {
    setStatus(ViewStatus.Loading);
    formData["created_at"] = "2022-01-23";
    _diaryLocalStorage.append(formData);
    setStatus(ViewStatus.Ready);
  }
}
