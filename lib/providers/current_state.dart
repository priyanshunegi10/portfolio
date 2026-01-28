import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/phone_home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone16ProMax;
  int knobSelected = 2;
  bool isMianScreen = true;
  Widget currentScreen = PhoneHomePage();
  String? title;
  void changeSelectedDevices(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  void changeGradient(int index) {
    knobSelected = index;
    notifyListeners();
  }

  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void changeScreen(Widget change, bool ismain, {String? titleL}) {
    currentScreen = change;
    isMianScreen = ismain;
    title = titleL;
    notifyListeners();
  }
}
