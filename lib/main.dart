import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessApp/pedometer.dart';
import 'package:fitnessApp/screens/homePage.dart';
// import 'package:fitnessApp/screens/homePage.dart';
// import 'package:fitnessApp/screens/pedometer.dart';
// import 'package:fitnessApp/screens/profile.dart';
// import 'package:fitnessApp/tempPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white30,
    statusBarColor: Colors.white30,
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      // theme: MyTheme.lightTheme(context),
      // darkTheme: Mytheme.darkTheme(context),
      home: HomePage(),
    );
  }
}
