import 'package:flutter/material.dart';
import 'package:fitnessApp/widgets/sideBar.dart';

class FaqPage extends StatefulWidget {
  FaqPage({Key key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    Color teal = Color(0XFF338678);
    return Scaffold(
      drawer: Sidebar(),
      body: Container(
        width: double.infinity,
        color: teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("FAQ Page",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
