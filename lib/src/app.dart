import 'package:android_pbl/src/components/image_data.dart';
import 'package:android_pbl/src/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
            () => Scaffold(
        appBar: AppBar(),
        body: IndexedStack(
          index: controller.pageIndex.value,
          children: [
            Container(child: Container(child: Text('HOME')),),
            Container(child: Container(child: Text('SEARCH')),),
            Container(child: Container(child: Text('UPLOAD')),),
            Container(child: Container(child: Text('ACTIVITY')),),
            Container(child: Container(child: Text('MYPAGE')),),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.pageIndex.value,
          elevation: 0,
          onTap: controller.changeBottomNav,
          items: [
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOff),
              activeIcon: ImageData(IconsPath.homeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.searchOff),
              activeIcon: ImageData(IconsPath.searchOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.uploadIcon),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.activeOff),
              activeIcon: ImageData(IconsPath.activeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              label: 'home',
            ),
          ],
        ),
      ),
      ),
      onWillPop: controller.willPopActioin,
    );
  }
}