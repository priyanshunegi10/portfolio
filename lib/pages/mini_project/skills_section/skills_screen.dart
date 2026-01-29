import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/skill_model.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Technical Skills",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "My technical arsenal and tools I use.",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),

              // 1. MAIN STACK
              _buildSkillCategory(
                title: "Mobile Development (Core)",
                skills: [
                  SkillModel("Flutter", Colors.blue),
                  SkillModel("Dart", Colors.blueAccent),
                  SkillModel("Provider", Colors.purpleAccent),
                  SkillModel("GetX", Colors.purple),
                  SkillModel("Clean Architecture", Colors.teal),
                ],
              ),

              // 2. BACKEND & DATABASE
              _buildSkillCategory(
                title: "Backend & Cloud",
                skills: [
                  SkillModel("Firebase", Colors.orangeAccent),
                  SkillModel("Firestore", Colors.orange),
                  SkillModel("REST API", Colors.green),
                  SkillModel("JSON Parsing", Colors.greenAccent),
                ],
              ),

              // 3. PROGRAMMING LANGUAGES
              _buildSkillCategory(
                title: "Programming Languages",
                skills: [
                  SkillModel("Java", Colors.redAccent),
                  SkillModel("C++", Colors.blueGrey),
                  SkillModel("HTML/CSS", Colors.deepOrange),
                ],
              ),

              // 4. TOOLS
              _buildSkillCategory(
                title: "Tools & Version Control",
                skills: [
                  SkillModel("Git", Colors.black87),
                  SkillModel("GitHub", Colors.black),
                  SkillModel("Postman", Colors.orange),
                  SkillModel("VS Code", Colors.blue),
                  SkillModel("Android Studio", Colors.green),
                  SkillModel("AI Tools", Colors.indigo),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory({required String title, required List<SkillModel> skills}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) => _buildChip(skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(SkillModel skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: skill.color.withOpacity(0.1), // Light background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: skill.color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dot Indicator
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: skill.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            skill.name,
            style: GoogleFonts.firaCode(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
