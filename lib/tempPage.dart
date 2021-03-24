import 'package:fitnessApp/screens/faqPage.dart';
import 'package:fitnessApp/screens/homePage.dart';
import 'package:fitnessApp/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  TempPage({Key key}) : super(key: key);

  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade300,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            IndexedStack(
              index: index,
              children: [HomePage(), ProfilePage(), FaqPage()],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.directions_run_rounded),
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.person_2_fill),
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.home),
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.archivebox),
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
