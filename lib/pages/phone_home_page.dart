import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneHomePage extends StatelessWidget {
  const PhoneHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState = Provider.of<CurrentState>(
      context,
      listen: false,
    );
    return Container(
      // Outer padding for the whole screen area
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: GridView.builder(
        // Disable GridView scrolling if you want the phone frame to handle scrolling
        // or set to AlwaysScrollableScrollPhysics() if needed.
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 Apps per row (standard for phones)
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
                onPressed: () {
                  if (app.link != null) {
                    currentState.launchInBrowser(app.link!);
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
                        : Image.asset(
                            app.assetPath!,
                            width: 30,
                            height: 30,
                          )
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
