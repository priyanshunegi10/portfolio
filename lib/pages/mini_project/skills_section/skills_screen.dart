import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xfff5f4e7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "My Skills",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: skills.map((skill) {
                      return Chip(
                        label: Text(
                          skill.skillName,
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: skill.colorS,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
