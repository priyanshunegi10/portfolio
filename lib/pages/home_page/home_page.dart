import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:portfolio/widgets/blur_container.dart';
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
                  Column(
                    children: [
                      BlurContainer(height: 395, width: 247),
                      SizedBox(height: 15),
                      BlurContainer(height: 175, width: 247),
                    ],
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
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.start,
                              children: [
                                ...List.generate(
                                  apps.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 70,
                                    ),
                                    child: Column(
                                      children: [
                                        CustomButton(
                                          margin: EdgeInsets.only(bottom: 5),
                                          borderRadius:
                                              currentState.currentDevice ==
                                                  Devices.ios.iPhone16ProMax
                                              ? 8
                                              : 100,
                                          onPressed: () {},
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
                                            child: Flexible(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
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
                      BlurContainer(height: 175, width: 247),
                    ],
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
