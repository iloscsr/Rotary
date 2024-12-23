import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs; // Başlangıçta IndexView için ayarlandı

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
