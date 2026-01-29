import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/pages/home_page/phone_screen_wrapper.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/widgets/blur_container.dart';
import 'package:portfolio/widgets/rain_cloud.dart';
import 'package:portfolio/widgets/tilt_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState = Provider.of<CurrentState>(
      context,
      listen: false,
    );

    Size cloudImageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, _) {
              return Container(
                decoration: BoxDecoration(
                  gradient: colorPalette[currentState.knobSelected].gradient,
                ),
              );
            },
          ),
          RainCloud(opposid: false, top: 20),
          RainCloud(opposid: true, top: 280),
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, _) {
              return SvgPicture.asset(
                colorPalette[currentState.knobSelected].svgPath,
                height: cloudImageSize.height,
                fit: BoxFit.cover,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TiltWidget(
                    isLeft: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          BlurContainer(
                            height: 395,
                            width: 247,
                            childG: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Priyanshu",
                                  style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          BlurContainer(
                            height: 175,
                            width: 247,
                            childG: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 25),
                                  decoration: BoxDecoration(),
                                  height: 60,
                                  width: 60,
                                  child: SvgPicture.asset(
                                    "assets/icons/topmat.svg",
                                    fit: BoxFit.cover,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "Let's Connect!",
                                  style: GoogleFonts.lato(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: cloudImageSize.height - 100,
                    child: Consumer<CurrentState>(
                      builder: (context, _, _) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: Container(
                            decoration: BoxDecoration(
                              gradient: colorPalette[currentState.knobSelected]
                                  .gradient,
                            ),
                            child: PhoneScreenWrapper(
                              childG: currentState.currentScreen,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TiltWidget(
                    isLeft: false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          BlurContainer(
                            height: 395,
                            width: 247,
                            childG: Center(
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                    colorPalette.length,
                                    (index) => Consumer<CurrentState>(
                                      builder: (context, _, _) {
                                        return CustomButton(
                                          margin: EdgeInsets.all(10),
                                          onPressed: () {
                                            currentState.changeGradient(index);
                                          },
                                          pressed:
                                              currentState.knobSelected == index
                                              ? Pressed.pressed
                                              : Pressed.notPressed,
                                          animate: true,
                                          isThreeD: true,
                                          borderRadius: 100,
                                          height: 52,
                                          width: 52,
                                          shadowColor: Colors.white,
                                          backgroundColor:
                                              colorPalette[index].color,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          BlurContainer(
                            height: 175,
                            width: 247,
                            childG: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "The best way to predict the future is to invent it.",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "— Alan Kay",
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    devices.length,
                    (index) => Selector<CurrentState, DeviceInfo>(
                      selector: (context, provider) => provider.currentDevice,
                      builder: (context, _, _) {
                        return CustomButton(
                          height: 38,
                          width: 38,
                          borderRadius: 100,
                          backgroundColor: Colors.black,
                          onPressed: () {
                            currentState.changeSelectedDevices(
                              devices[index].device,
                            );
                          },
                          animate: true,
                          pressed:
                              currentState.currentDevice ==
                                  devices[index].device
                              ? Pressed.pressed
                              : Pressed.notPressed,
                          isThreeD: true,
                          shadowColor: Colors.white,
                          child: Center(
                            child: Icon(
                              devices[index].icon,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
