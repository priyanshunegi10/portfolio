import 'dart:ui';

class ProjectModel {
  final String title;
  final String description;
  final String techStack; // e.g., "Flutter • Firebase • Provider"
  final String? githubLink;
  final String? liveLink; // Agar playstore/web link hai
  final Color color; // Card ka background color

  ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    this.githubLink,
    this.liveLink,
    required this.color,
  });
}
