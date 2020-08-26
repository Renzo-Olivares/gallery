import 'package:flutter/widgets.dart';

class BottomDrawerSettings with ChangeNotifier {
  bool _inboxCanScroll = false;
  bool get inboxCanScroll => _inboxCanScroll;
  set inboxCanScroll(bool value) {
    _inboxCanScroll = value;
    notifyListeners();
  }
}
