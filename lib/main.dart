import 'package:fitness_app/Hodomojo%20Task/homePage.dart';
import 'package:fitness_app/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.transparent,
  //   statusBarColor: Colors.transparent,
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) {
    //     return TodosProvider();
    //   },
    //   child:
    return MaterialApp(
      title: 'Hodomojo App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xFFf6f5ee),
      ),
      debugShowCheckedModeBanner: false,
      home: HodomojoHomePage(),
    );
    // );
  }
}
