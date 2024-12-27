import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:rotary/controller/main_view_controller/navigation_controller.dart';
import 'package:rotary/core/constants/ui_constants.dart';
import 'package:rotary/view/index/index_view.dart';
import 'package:rotary/view/members/members_view.dart';
import 'package:rotary/view/we/we_view.dart';

class MainView extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = const [
    IndexView(), // Ana Sayfa
    WeView(), // Biz
    MembersView(), // Üyeler
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConst.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConst.whiteColor,
          title: Image.asset("assets/logo/logo1.jpg", height: 60),
        ),
        body: pages[navigationController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navigationController.selectedIndex.value,
          onTap: navigationController.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Biz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Üyeler',
            ),
          ],
        ),
      );
    });
  }
}
