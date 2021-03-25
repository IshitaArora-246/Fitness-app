import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fitnessApp/widgets/sideBar.dart';
import 'package:pedometer/pedometer.dart';
import 'package:flutter_mobile_carousel/carousel.dart';
import 'package:flutter_mobile_carousel/carousel_arrow.dart';
import 'package:flutter_mobile_carousel/default_carousel_item.dart';
import 'package:flutter_mobile_carousel/types.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final steps = 10250;
    final Color teal = Color(0XFF338678);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var calories = (steps / 35).round();
    return Scaffold(
        drawer: Sidebar(),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/images/exercise.png",
                  width: 300,
                ),
                SizedBox(height: 10),
                Text("40 Steps",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                                width: screenWidth * 0.60,
                                height: screenHeight * 0.23,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/rc1a.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.grey[200]),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade500.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text("Let's compete with friends",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32)),
                                )),
                          ],
                        ),
                        SizedBox(width: 8),
                        Stack(
                          children: [
                            Container(
                                width: screenWidth * 0.60,
                                height: screenHeight * 0.23,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/rc2.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.grey[200]),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade500.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text("Unlock Achievements",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32)),
                                )),
                          ],
                        ),
                        SizedBox(width: 8),
                        Stack(
                          children: [
                            Container(
                                width: screenWidth * 0.60,
                                height: screenHeight * 0.23,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/rc3.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.grey[200]),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade500.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text("Start a Challenge",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 32)),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Calories burnt Today : $calories",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/grf.png"),
                ),
              ],
            ),
          ),
        ));
  }
}
