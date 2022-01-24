import 'dart:developer';

import 'package:diary_sample/utils/input_validator.dart';
import 'package:diary_sample/view_model/diary.dart';

// import 'package:diary_sample/view_model/base.dart';
// import 'package:diary_sample/view_model/entry_d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../view_model/base.dart';

class AddEntry extends StatefulWidget {
  static const routeName = 'add-entry';

  const AddEntry({Key? key}) : super(key: key);

  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  Map<String, String> _formData = {};
  final _addEntryFormKey = GlobalKey<FormState>();

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      inputDecorationTheme:
                          const InputDecorationTheme(border: InputBorder.none),
                    ),
                    child: Form(
                      key: _addEntryFormKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 45),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 3,
                              cursorColor: const Color(0xFF3C4858),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: '일기 제목 입력?',
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              validator: (val) {
                                return InputValidator.title(val);
                              },
                              onSaved: (value) => _formData['title'] = value!,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            cursorColor: const Color(0xFF3C4858),
                            decoration: const InputDecoration.collapsed(
                                hintText:
                                    '일기를 작성해 주세요..'),
                            validator: (val) {
                              return InputValidator.content(val);
                            },
                            onSaved: (value) => _formData['content'] = value!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFF3C4858).withOpacity(.5),
                                offset: const Offset(1.0, 10.0),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          semanticLabel: 'Back',
                          size: 22,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3C4858),
        child: Provider.of<DiaryViewModel>(context).viewStatus ==
                ViewStatus.Loading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : const Icon(
                Icons.check,
                semanticLabel: 'Save',
              ),
        onPressed: () {
          if (Provider.of<DiaryViewModel>(context, listen: false).viewStatus ==
              ViewStatus.Loading) return;
          final form = _addEntryFormKey.currentState;

          if (form!.validate()) {
            form.save();
            _handleAddEntry();
          }

          // if (Provider.of<EntryViewModel>(context).viewStatus ==
          //     ViewStatus.Loading) return;
          // if (form.validate()) {
          //   form.save();
          //   _handleAddEntry();
          // }
        },
      ),
    );
  }

  _handleAddEntry() async {
    Provider.of<DiaryViewModel>(context, listen: false).create(_formData);
    log("데이터가 저장되었습니다");

    // final response = await Provider.of<EntryViewModel>(context, listen: false)
    //     .create(_formData);
    // if (response) {
    //   Navigator.of(context).pushNamed(Home.routeName);
    // }
  }
}
