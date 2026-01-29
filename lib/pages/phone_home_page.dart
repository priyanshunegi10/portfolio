import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          childAspectRatio:
              0.8, // Adjusts height relative to width (tweak this to fit text)
          mainAxisSpacing: 15, // Vertical space between rows
          crossAxisSpacing: 15, // Horizontal space between apps
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                width: 60,
                height: 60,
                // Only curve corners if it's an iPhone 16 Pro Max, else circle
                borderRadius:
                    currentState.currentDevice == Devices.ios.iPhone16ProMax
                    ? 10
                    : 100,
                backgroundColor: app.color,
                margin: const EdgeInsets.only(bottom: 5),
                onPressed: () async {
                  if (app.link != null) {
                    // CHECK: Agar ye Gmail hai, toh Mailto scheme use karo
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
                        // Agar phone mein koi email app nahi hai
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("No email client found!")),
                        );
                      }
                    }
                    // Agar normal link (LinkedIn/GitHub/Resume) hai
                    else {
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
                child: app.assetPath != null
                    ? app.assetPath!.endsWith(".svg")
                          ? SvgPicture.asset(
                              app.assetPath!,
                              width: 30,
                              height: 30,
                            )
                          : Image.asset(app.assetPath!, width: 30, height: 30)
                    : Center(
                        child: Icon(app.icon, size: 30, color: Colors.black),
                      ),
              ),
              // App Title
              SizedBox(
                width: 60, // Constrain text width
                child: Text(
                  app.title,
                  textAlign: TextAlign.center, // Center align text
                  maxLines: 1, // Prevent text from breaking layout
                  overflow: TextOverflow.ellipsis, // Add "..." if too long
                  style: GoogleFonts.poppins(
                    fontSize: 10, // Slightly smaller for better fit
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
