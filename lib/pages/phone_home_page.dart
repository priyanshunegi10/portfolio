import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';

class PhoneHomePage extends StatelessWidget {
  const PhoneHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState = Provider.of<CurrentState>(
      context,
      listen: false,
    );
    return Container(
      decoration: BoxDecoration(),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        children: [
          ...List.generate(
            apps.length,
            (index) => Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              child: Column(
                children: [
                  CustomButton(
                    margin: EdgeInsets.only(bottom: 5),
                    borderRadius:
                        currentState.currentDevice == Devices.ios.iPhone16ProMax
                        ? 8
                        : 100,
                    onPressed: () {
                      if (apps[index].link != null) {
                        currentState.launchInBrowser(apps[index].link!);
                      }
                    },
                    width: 50,
                    height: 50,
                    backgroundColor: apps[index].color,
                    child: Center(
                      child: Icon(
                        apps[index].icon,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        apps[index].title,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
