import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone16ProMax;
  int knobSelected = 2;
  void changeSelectedDevices(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  void changeGradient(int index) {
    knobSelected = index;
    notifyListeners();
  }
}
