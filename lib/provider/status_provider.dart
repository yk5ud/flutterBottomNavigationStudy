import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/home.dart';

class StatusProvider with ChangeNotifier {
  TabItem currentTab = TabItem.fine;
  int currentIndex = TabItem.fine.index;

  void setBottomNavigation(int index) {
    if (index == TabItem.fine.index) {
      currentTab = TabItem.fine;
    } else if (index == TabItem.cloud.index) {
      currentTab = TabItem.cloud;
    } else {
      currentTab = TabItem.rain;
    }
    currentIndex = index;
    fineState = 0;
    cloudState = 0;
    rainState = 0;
    notifyListeners();
  }

  /// fine Page State
  int fineState = 0;

  setNextFineState() {
    fineState++;
    if (fineState > 1) {
      fineState = 0;
    }
    notifyListeners();
  }

  setBackFineState() {
    fineState--;
    if (fineState < 0) {
      fineState = 0;
    }
    notifyListeners();
  }

  /// cloud Page State
  int cloudState = 0;

  setNextCloudState() {
    cloudState++;
    if (cloudState > 2) {
      cloudState = 0;
    }
    notifyListeners();
  }

  setBackCloudState() {
    cloudState--;
    if (cloudState < 0) {
      cloudState = 0;
    }
    notifyListeners();
  }

  setInitCloudState() {
    cloudState = 0;
    notifyListeners();
  }

  /// rain Page State
  int rainState = 0;

  setNextRainState() {
    rainState++;
    if (rainState > 3) {
      rainState = 0;
    }
    notifyListeners();
  }

  setBackRainState() {
    rainState--;
    if (rainState < 0) {
      rainState = 0;
    }
    notifyListeners();
  }

  setInitRainState() {
    rainState = 0;
    notifyListeners();
  }
}
