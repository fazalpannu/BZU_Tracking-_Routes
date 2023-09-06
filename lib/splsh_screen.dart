import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bzu_online_route_tracking_app/login.dart';
import 'package:bzu_online_route_tracking_app/registration.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 7), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Image(image: AssetImage('img/bzu.jpeg')),
                ),
              ),

              SafeArea(
                child: Center(
                  child: SizedBox(
                    // width: 250.0,
                    child: TextLiquidFill(
                      text: 'BZU route  Tracking App\nby Abu Bakar Zulfiqar',
                      textAlign: TextAlign.center,
                      waveColor: Colors.black,
                      boxBackgroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.bold,
                      ),
                      // boxHeight: 200.0,
                    ),
                  ),
                ),
              ),
              // const Align(
              //   alignment: Alignment.center,
              //   child: Text('BZU route \n Tracking App',
              //       textAlign: TextAlign.center,
              //       style:
              //           TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
