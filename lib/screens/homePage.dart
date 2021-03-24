import 'package:flutter/material.dart';
import 'package:fitnessApp/widgets/sideBar.dart';

class HomePage extends StatelessWidget {
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
                  height: 30,
                ),
                Image.asset("assets/images/run.png"),
                SizedBox(height: 10),
                Text("$steps Steps",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.23,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/rc1a.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200]),
                        child: Center(
                          child: Text("Let's compete with friends",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 40)),
                        ),
                      ),
                    ],
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
