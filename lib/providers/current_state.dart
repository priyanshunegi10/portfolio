import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone16ProMax;

  void changeSelectedDevices(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }
}
