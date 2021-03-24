import 'package:fitnessApp/screens/faqPage.dart';
import 'package:fitnessApp/screens/homePage.dart';
import 'package:fitnessApp/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color teal = Color(0XFF338678);
    return Drawer(
      elevation: 16.0,
      child: Container(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: teal),
                accountName: Text("Harvey Spector"),
                accountEmail: Text("Example@gmail.com"),
                currentAccountPicture: Image.asset(
                  "assets/images/m.jpg",
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text('My Profile',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                    (HomePage) => true);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text('Home',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (HomePage) => true);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.archivebox,
                color: Colors.black,
              ),
              title: Text("FAQ's",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaqPage(),
                    ),
                    (HomePage) => true);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.square_arrow_left,
                color: Colors.black,
              ),
              title: Text('Logout',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {
                // Function that will sign out
              },
            ),
          ],
        ),
      ),
    );
  }
}
