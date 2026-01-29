import 'package:flutter/material.dart';

class JobExperience {
  final String title;
  final String company;

  final String endDate;
  final List<String>? bulletPoints;
  final String location;
  final Color color;
  JobExperience({
    required this.color,
    required this.location,
    required this.title,
    required this.company,

    required this.endDate,
     this.bulletPoints,
  });
}
