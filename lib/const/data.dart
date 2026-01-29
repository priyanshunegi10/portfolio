import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/models/colors_model.dart';
import 'package:portfolio/models/devices_model.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/skill_model.dart';
import 'package:portfolio/pages/mini_project/about_section/about_screen.dart';
import 'package:portfolio/pages/mini_project/project_screen/project_screen.dart';
import 'package:portfolio/pages/mini_project/skills_section/skills_screen.dart';
import 'package:portfolio/pages/mini_project/education_section/education_screen.dart';

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
  AppModel(
    title: "About",
    color: Colors.white,
    // icon: Icons.ac_unit_outlined,
    screen: AboutScreen(),
    assetPath: "assets/icons/man.png",
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    screen: SkillsScreen(),
    assetPath: "assets/icons/skill.png",
  ),
  AppModel(
    title: "Linkedin",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    link: linkedIn,
    assetPath: "assets/icons/linkedin.png",
  ),
  AppModel(
    title: "Github",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    link: gitHub,
    assetPath: "assets/icons/github.png",
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    screen: EducationScreen(),
    assetPath: "assets/icons/education.png",
  ),
  AppModel(
    title: "Resume",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    link: resumeLink,
    assetPath: "assets/icons/cv.png",
  ),
  AppModel(
    title: "Gmail",
    color: Colors.white,
    //icon: Icons.ac_unit_outlined,
    link: email,
    assetPath: "assets/icons/gmail.png",
  ),
  AppModel(
    title: "Projects",
    color: Colors.white,
    screen: ProjectsScreen(),
    assetPath: "assets/icons/project.png",
  ),
];

const String linkedIn = "https://www.linkedin.com/in/priyanshu-negi-72b077295/";
const String gitHub = "https://github.com/priyanshunegi10";
const String email = "https://npriyanshu377@gmail.com";
const String resumeLink =
    "https://drive.google.com/file/d/1eEPX2uPfgRBxadrOOFRrZMxCzuyk_R5W/view?usp=drive_link";
const String introduction =
    "Welocome to my Portfolio Website,As a Computer Science undergraduate specializing in Mobile Application Development, I combine strong engineering fundamentals with practical coding skills. My primary weapon of choice is Flutter (Dart), which I use to build cross-platform applications that are both performant and scalable.\nBeyond mobile dev, I have a solid grounding in Java, and C++. I believe in writing clean, maintainable code and am currently focused on integrating AI and Machine Learning into mobile ecosystems.";

 
// Tumhare Projects ka Data
List<ProjectModel> myProjects = [
  ProjectModel(
    title: "Event Booking App",
    description:
        "Admin & User panels with real-time ticket syncing via Firestore. Includes dynamic theme switching.",
    techStack: "Flutter • MultiProvider • Firebase",
    githubLink: "https://github.com/priyanshunegi10/event_booking_app",
    color: Colors.orangeAccent.withOpacity(0.2),
  ),
  ProjectModel(
    title: "Smart Waste Management",
    description:
        "AI-powered waste classification using Imagga API and Google Maps for location tracking.",
    techStack: "Dart • REST API • Google Maps",
    githubLink: "https://github.com/priyanshunegi10/waste_management",
    color: Colors.greenAccent.withOpacity(0.2),
  ),
  ProjectModel(
    title: "Portfolio App",
    description:
        "Interactive portfolio with dynamic device frames and state management.",
    techStack: "Flutter • Provider • Animations",
    githubLink: "https://github.com/priyanshunegi10/portfolio",
    color: Colors.blueAccent.withOpacity(0.2),
  ),
];
final List<JobExperience> education = [
  JobExperience(
    color: Colors.orangeAccent, // Changed to a warmer tone
    location: "New Delhi, India",
    title: 'High School (10th & 12th)',
    company: 'Sarvodaya Vidyalaya, Aliganj',
    endDate: 'Feb 2023',
  ),
  JobExperience(
    color: Colors.blueAccent,
    location: "Faridabad, India",
    title: 'Bachelors in Computer Application',
    company: 'Echelon Institute of Technology',
    endDate: 'Present (Grad. 2026)',
    bulletPoints: [
      'Specializing in Mobile App Development (Flutter).',
      'Final Year Student working on live projects.',
    ],
  ),
];

// final List<JobExperience> jobExperiences = [
//   JobExperience(
//     color: Colors.blue,
//     location: "Banglore, India",
//     title: 'Full Stack Developer',
//     company: 'Stimuler',
//     startDate: 'Feb 2023',
//     endDate: 'Present',
//     bulletPoints: [
//       "Actively develop and manage push notifications to engage users effectively.",
//       "Successfully set up in-app purchase functionality for both iOS and Android platforms.",
//       "Utilize the Provider package for streamlined state management and implement real-time data streams.",
//       "Employ Amplitude and Firebase Analytics to track and analyze user behavior, informing data-driven decisions.",
//       "The Startup has over 3,00,000 lakh active users",
//     ],
//   ),
//   // Add more job experiences here...
//   JobExperience(
//     color: Colors.redAccent,
//     location: "Remote",
//     title: 'Flutter Developer',
//     company: 'Perpetuum India',
//     startDate: 'Oct 2022',
//     endDate: 'Jan 2023',
//     bulletPoints: [
//       "Establish voice calling functionality using Agora SDK to enable real-time communication within the app.",
//       "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
//       "Collaborate directly with Stanza Living's CTO, gaining insights into industry best practices and cutting-edge technologies.",
//       "Acquire proficiency in server-driven UI setup, optimizing app flexibility and scalability through dynamic configuration.",
//     ],
//   ),
//   JobExperience(
//     color: Colors.orangeAccent,
//     location: "Remote",
//     title: 'App Architecture Intern',
//     company: 'Habeato',
//     startDate: 'Oct 2021',
//     endDate: 'Nov 2021',
//     bulletPoints: [
//       "Collaborated with founders to develop a HealthifyMe clone, demonstrating strong teamwork and app development skills.",
//       "Engineered complex animations to enhance user experience and app visual appeal.",
//       "Played an active role in system design processes, contributing to efficient and scalable app architecture.",
//     ],
//   ),
//   JobExperience(
//     color: Colors.greenAccent,
//     location: "Remote",
//     title: 'App Developer',
//     company: 'Kylo Apps',
//     startDate: 'Sep 2021',
//     endDate: 'Oct 2021',
//     bulletPoints: [
//       "Collaborated as a team member in developing a cryptocurrency wallet, akin to Trust Wallet, showcasing strong teamwork and blockchain app development expertise.",
//       "Proficiently integrated REST APIs into the application, enhancing its functionality and connectivity with external services.",
//     ],
//   ),
//   JobExperience(
//     color: Colors.black,
//     location: "Remote",
//     title: 'Flutter App Intern',
//     company: 'Cogent Web Services',
//     startDate: 'Dec 2020',
//     endDate: 'June 2021',
//     bulletPoints: [
//       "Independently developed a Life Simulator game using Flutter from scratch, applying state-of-the-art state management practices to ensure a top-tier user experience.",
//       "Leveraged Flutter's robust features to craft an immersive and captivating gameplay experience, demonstrating proficiency in app development.",
//       "Successfully implemented Google Ads, in-app purchases, and Hive database for efficient user data storage and monetization strategies.",
//       "Generated creative ideas for client pitches, fostering creativity and ensuring the game's entertainment value and thought-provoking nature.",
//       "Published the game on the Play Store, achieving over 5,000 downloads, showcasing the ability to deliver a popular and engaging mobile application.",
//     ],
//   ),
// ];
