import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/const/data.dart';
import 'package:portfolio/providers/current_state.dart';
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.blue, Colors.black45],
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/images/cloudy_blue.svg",
            height: cloudImageSize.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: cloudImageSize.height - 100,
                    child: Consumer<CurrentState>(
                      builder: (context, _, _) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: const Center(
                            child: Text(
                              "Hello world",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
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
