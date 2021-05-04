import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final lightBlue = Color(0XFF2E79F0);
  final darkBlue = Color(0XFF1851D4);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [darkBlue, lightBlue])),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  print("Go back");
                                }),
                            Text("Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500)),
                            Spacer(),
                            Text("Sign-out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            IconButton(
                                icon: Icon(Icons.login_rounded),
                                onPressed: () {})
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  minRadius: 30,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Naman",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Row(
                                    children: [
                                      Text("Target Industry: Architecture"),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                color: lightBlue.withOpacity(0.3))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.asset(
                                    "assets/task/id-card.png",
                                    color: lightBlue,
                                    height: 36,
                                    width: 36,
                                  ),
                                ),
                                Text(
                                  "Personal",
                                  style: TextStyle(
                                      color: lightBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: lightBlue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.edit_rounded,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    cardData(
                                        "Date of Birth: ", "15 April, 2021"),
                                    cardData("E-Mail: ", "example@gmail.com"),
                                    cardData("Location: ", "Guwahati, Assam"),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Container(
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    color: lightBlue.withOpacity(0.3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Image.asset(
                                        "assets/task/degree.png",
                                        color: lightBlue,
                                        height: 36,
                                        width: 36,
                                      ),
                                    ),
                                    Text(
                                      "Education",
                                      style: TextStyle(
                                          color: lightBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.edit_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        cardData("School: ", "DPS, Guwahati"),
                                        cardData("Standard: ", "10"),
                                        cardData("Location: ", "Kamrup, Assam"),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    color: lightBlue.withOpacity(0.3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Image.asset(
                                        "assets/task/certificate.png",
                                        color: lightBlue,
                                        height: 36,
                                        width: 36,
                                      ),
                                    ),
                                    Text(
                                      "Experience",
                                      style: TextStyle(
                                          color: lightBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.edit_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 70,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [darkBlue, lightBlue])),
                        child: Center(
                            child: Text("EDIT SUGGESTED TARGETS",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16))))
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        color: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.home, color: lightBlue)),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/task/compass.png",
                color: Colors.grey[600],
                height: 24,
                width: 24,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/task/degree.png",
                  color: Colors.grey[600],
                  height: 24,
                  width: 24,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey[600],
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/task/chatting.png",
                  color: Colors.grey[600],
                  height: 24,
                  width: 24,
                )),
          ],
        ),
      ),
    );
  }

  Widget cardData(String key, String value) {
    return Column(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: key,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: lightBlue)),
          TextSpan(
              text: value,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                  fontSize: 14)),
        ])),
        SizedBox(height: 12),
      ],
    );
  }
}
