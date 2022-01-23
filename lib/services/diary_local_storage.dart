import 'dart:convert';
import 'dart:developer';

import 'package:diary_sample/models/diary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryLocalStorage {
  Future<List<Diary>> diaries() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List<String> data = _pref.getStringList("diaries") ?? [];

    return List<Diary>.from(data.map((e) => Diary.fromJson(json.decode(e))),
        growable: true);
  }

  Future<void> clear() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();
  }

  Future<void> append(Map<String, dynamic> formData) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List<Diary> data = await diaries();
    // formData["id"] = data.length;
    formData["image_url"] = "2020-01-23";


    Diary.fromJson(formData);
    data.add(Diary.fromJson(formData));


    _pref.setStringList(
        "diaries", List<String>.from(data.map((e) => json.encode(e.toMap()))));
  }
}
