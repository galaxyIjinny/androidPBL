import 'dart:io';

import 'package:android_pbl/src/components/message_popup.dart';
import 'package:android_pbl/src/pages/upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (!bottomHistory.contains(value)) {
      bottomHistory.add(value);
      print(bottomHistory);
    }
  }

  Future<bool> willPopActioin() async {
    if (bottomHistory.length == 1) {
      showDialog(context: Get.context!, builder: (context) => MessagePopup(
        message: '종료하시겠습니까?',
        okCallback: () {
          exit(0);
        },
        cancelCallback: Get.back,
        title: '시스템',
      ));
      print('exit');
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}