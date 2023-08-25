import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier {
  ValueNotifier<int> activeIndex = ValueNotifier(0);

  changePage(int index) {
    activeIndex.value = index;
  }
}
