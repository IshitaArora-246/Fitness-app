import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color teal = Color(0XFF338678);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 390,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          (CupertinoIcons.bars),
                          size: 30,
                          semanticLabel: "drawer",
                        ),
                        Icon(
                          Icons.edit,
                          size: 30,
                          semanticLabel: "Edit",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    minRadius: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ishita",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Divider(
                    height: 40,
                    thickness: 0.7,
                    endIndent: 25,
                    indent: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("7",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500)),
                          Text("Goals completed",
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                      Column(
                        children: [
                          Text("4",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500)),
                          Text("Friends", style: TextStyle(fontSize: 18))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.grey[200]),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Insights",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: teal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  cards("Total Steps", "2,00,000", "assets/images/shoe.png"),
                  SizedBox(height: 15),
                  cards("Km walked", "50km", "assets/images/km.png"),
                  SizedBox(height: 15),
                  cards("Calories Burnt", "2,000", "assets/images/cal.png"),
                  SizedBox(height: 15),
                  cards("Fuel Saved", "25L", "assets/images/fuel.png"),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cards(String key, String value, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset(
                  "$path",
                  width: 45,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$value",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("$key", style: TextStyle(fontSize: 15))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
