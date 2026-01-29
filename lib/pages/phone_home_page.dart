import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneHomePage extends StatelessWidget {
  const PhoneHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState = Provider.of<CurrentState>(
      context,
      listen: false,
    );
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.7,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                width: 75,
                height: 75,
                borderRadius:
                    currentState.currentDevice == Devices.ios.iPhone16ProMax
                    ? 10
                    : 100,
                backgroundColor: app.color,
                margin: const EdgeInsets.only(bottom: 5),
                onPressed: () async {
                  if (app.link != null) {
                    // Logic for Gmail vs Normal Links
                    if (app.title == "Gmail" || app.link!.contains("@")) {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: app.link!,
                        query:
                            'subject=Hiring Inquiry&body=Hi Priyanshu, I saw your portfolio...',
                      );

                      try {
                        await launchUrl(emailLaunchUri);
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("No email client found!"),
                            ),
                          );
                        }
                      }
                    } else {
                      currentState.launchInBrowser(app.link!);
                    }
                  } else if (app.screen != null) {
                    currentState.changeScreen(
                      app.screen!,
                      false,
                      titleL: app.title,
                    );
                  }
                },
                // FIXED: SVG Logic Removed, only PNG supported now
                child: app.assetPath != null
                    ? Image.asset(
                        app.assetPath!,
                        width: 50, // Icon size adjust kar lena agar chhota lage
                        height: 50,
                        fit: BoxFit.contain,
                      )
                    : Center(
                        child: Icon(app.icon, size: 30, color: Colors.black),
                      ),
              ),
              // App Title
              SizedBox(
                width: 60,
                child: Text(
                  app.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
