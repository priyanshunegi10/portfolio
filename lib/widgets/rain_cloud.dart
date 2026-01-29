import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RainCloud extends StatefulWidget {
  final double top;
  final bool opposid;
  const RainCloud({super.key, required this.top, required this.opposid});

  @override
  State<RainCloud> createState() => _RainCloudState();
}

class _RainCloudState extends State<RainCloud> {
  Artboard? rainArtBook;
  SMIInput<bool>? rain;
  SMIInput<bool>? hover;
  @override
  void initState() {
    rootBundle.load("assets/rive/rain.riv").then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
        artboard,
        "State Machine 1",
      );

      if (controller != null) {
        artboard.addController(controller);
        rain = controller.findInput("isPressed");
        hover = controller.findInput("isHover");

        rain?.value = false;
        hover?.value = false;
      }

      setState(() {
        rainArtBook = artboard;
      });
    });
    super.initState();
  }

  void playRain() {
    if (rain?.value == false) {
      rain?.value = true;
    } else {
      rain?.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return rainArtBook != null
        ? TweenAnimationBuilder(
            duration: Duration(seconds: 600),
            tween: Tween(
              begin: widget.opposid ? size.width - 200 : 0,
              end: widget.opposid ? 0 : size.width - 200,
            ),
            builder: (context, value, _) {
              return Positioned(
                top: widget.top,

                left: value.toDouble(),
                child: SizedBox(
                  height: 100,
                  width: 220,
                  child: MouseRegion(
                    onEnter: (_) {
                      hover?.value = true;
                    },
                    onExit: (event) {
                      hover?.value = false;
                    },
                    child: GestureDetector(
                      onTap: () {
                        playRain();
                      },
                      child: Rive(
                        useArtboardSize: true,
                        fit: BoxFit.cover,
                        artboard: rainArtBook!,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container();
  }
}
