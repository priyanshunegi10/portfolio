import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  // Helper function URL kholne ke liye
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ya transparent agar pichhe ka bg chahiye
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Work",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: myProjects.length,
                itemBuilder: (context, index) {
                  final project = myProjects[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: project.color,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          project.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Tech Stack Chips
                        Text(
                          project.techStack,
                          style: GoogleFonts.firaCode(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Description
                        Text(
                          project.description,
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        // Buttons
                        Row(
                          children: [
                            if (project.githubLink != null)
                              ElevatedButton.icon(
                                onPressed: () =>
                                    _launchURL(project.githubLink!),
                                icon: const Icon(Icons.code, size: 16),
                                label: const Text("Code"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(80, 36),
                                ),
                              ),
                            const SizedBox(width: 10),
                            // Agar Live link bhi hai (Future proofing)
                            if (project.liveLink != null)
                              OutlinedButton.icon(
                                onPressed: () => _launchURL(project.liveLink!),
                                icon: const Icon(Icons.open_in_new, size: 16),
                                label: const Text("Live"),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
