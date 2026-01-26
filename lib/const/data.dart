import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/models/colors_model.dart';
import 'package:portfolio/models/devices_model.dart';

List<DevicesModel> devices = [
  DevicesModel(device: Devices.android.samsungGalaxyS25, icon: Icons.android),
  DevicesModel(device: Devices.ios.iPhone16ProMax, icon: Icons.apple),
  DevicesModel(device: Devices.ios.iPad, icon: Icons.tablet),
];

List<ColorsModel> colorPalette = [
  ColorsModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorsModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorsModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff00d6ca),
    gradient: const LinearGradient(
      colors: [Color(0xff00ebd5), Color(0xff293474)],
      stops: [0, 1],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ),
  ColorsModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorsModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorsModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange],
    ),
  ),
];

List<AppModel> apps = [
  AppModel(title: "About", color: Colors.white, icon: Icons.ac_unit_outlined),
  AppModel(title: "Skills", color: Colors.white, icon: Icons.ac_unit_outlined),
  AppModel(
    title: "Linkedin",
    color: Colors.white,
    icon: Icons.ac_unit_outlined,
    link: linkedIn,
  ),
  AppModel(
    title: "Github",
    color: Colors.white,
    icon: Icons.ac_unit_outlined,
    link: gitHub,
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: Icons.ac_unit_outlined,
  ),
  AppModel(
    title: "Resume",
    color: Colors.white,
    icon: Icons.ac_unit_outlined,
    link: resumeLink,
  ),
  AppModel(
    title: "Gamil",
    color: Colors.white,
    icon: Icons.ac_unit_outlined,
    link: email,
  ),
];

const String linkedIn = "https://www.linkedin.com/in/priyanshu-negi-72b077295/";
const String gitHub = "https://github.com/priyanshunegi10";
const String email = "npriyanshu377@gmail.com";
const String resumeLink =
    "https://docs.google.com/document/d/1NPTwCFFpkBX16UTTbt-vk1xhg1KGWqIq/edit?usp=drive_link&ouid=102046719414048051211&rtpof=true&sd=true";
const String introduction = "Welocome to my Portfolio Website,";
