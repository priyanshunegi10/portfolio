import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/phone_home_page.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';

class PhoneScreenWrapper extends StatelessWidget {
  final Widget childG;
  const PhoneScreenWrapper({super.key, required this.childG});

  @override
  Widget build(BuildContext context) {
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);

    return Column(
      children: [
        Consumer<CurrentState>(
          builder: (context, _, _) {
            if (instance.isMianScreen == false) {
              return Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      instance.title ?? "",
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        instance.changeScreen(PhoneHomePage(), true);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
        Expanded(child: childG),
      ],
    );
  }
}
