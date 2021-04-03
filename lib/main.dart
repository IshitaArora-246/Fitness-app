import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessApp/database/database.dart';
import 'package:fitnessApp/tempPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login/loginPage.dart';

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
    checkSignIn().then((value) => null);
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      // theme: MyTheme.lightTheme(context),
      // darkTheme: Mytheme.darkTheme(context),
      home: CheckUserStatus(),
    );
  }
}

class CheckUserStatus extends StatefulWidget {
  CheckUserStatus({Key key}) : super(key: key);

  @override
  _CheckUserStatusState createState() => _CheckUserStatusState();
}

class _CheckUserStatusState extends State<CheckUserStatus> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkSignIn(),
        builder: (context, snapshot) {
          var page;
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case "login":
                {
                  page = LoginPage();
                  break;
                }
              case "home":
                {
                  page = TempPage();
                  break;
                }
              case "initial":
                {
                  // page = InitialDetailPage();
                  break;
                }
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: page,
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

Future<String> checkSignIn() async {
  await DatabaseService().getCR();
  if (FirebaseAuth.instance.currentUser == null)
    return "login";
  else
    return "home";
}
