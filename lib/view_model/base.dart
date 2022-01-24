import 'package:flutter/foundation.dart';

/// 화면 상태 관리
enum ViewStatus { Loading, Ready }

class BaseViewModel extends ChangeNotifier {
  ViewStatus _status = ViewStatus.Ready;

  ViewStatus get viewStatus => _status;

  void setStatus(ViewStatus status) {
    _status = status;
    notifyListeners();
  }
}
