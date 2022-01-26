import 'package:diary_sample/ui/home.dart';
import 'package:diary_sample/ui/pages/page_diary_create.dart';
import 'package:diary_sample/ui/pages/page_diary_list.dart';
import 'package:diary_sample/ui/pages/page_diary_view.dart';
import 'package:diary_sample/view_model/diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

List<Future> systemChromeTask = [
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(systemChromeTask);
  // Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => DiaryViewModel(),
    )
  ], child: const DiaryApp()));
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3C4858),
        primaryIconTheme: const IconThemeData(color: Color(0xFF3C4858)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        PageDiaryList.routeName: (context) => const PageDiaryList(),
        PageDiaryCreate.routeName: (context) => const PageDiaryCreate(),
        PageDiaryView.routeName: (context) => const PageDiaryView()
      },
    );
  }
}
