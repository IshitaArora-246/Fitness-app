import 'dart:async';
import 'package:fitnessApp/login/otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class OtpVerification extends StatefulWidget {
  String verID;
  String phoneNumber;
  OtpVerification({@required this.verID, @required this.phoneNumber});
  @override
  _OtpVerificationState createState() =>
      _OtpVerificationState(phoneNumber: phoneNumber);
}

class _OtpVerificationState extends State<OtpVerification> {
  String phoneNumber;
  _OtpVerificationState({@required this.phoneNumber});

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  int timer;
  bool hasError = false;
  String otpString = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool loading;
  Color teal = Color(0XFF338678);
  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    loading = false;
    timer = 60;
    WidgetsBinding.instance.addPostFrameCallback(startTimer);
  }

  void startTimer(timestamp) {
    timer = 61;
    Timer.periodic(Duration(seconds: 1), (time) {
      if (!mounted) return;

      setState(() {
        timer = timer - 1;
      });
      if (timer == 0) {
        time.cancel();
      }
    });
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: loading,
            child: Opacity(
              opacity: loading ? 0.6 : 1,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: teal,
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                body: Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Image.asset(
                        "assets/images/otp.png",
                        width: 260,
                      ),
                      SizedBox(height: 40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                "Let's verify your OTP",
                                style: TextStyle(
                                    color: teal,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.visibility, color: teal),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: otpFields(context),
                      ),
                      Builder(builder: (context) {
                        return Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Didn't receive the OTP ? \n",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              children: [
                                TextSpan(
                                  text: "Resend",
                                  style: TextStyle(
                                    color: timer != 0
                                        ? Colors.grey.shade600
                                        : teal,
                                    fontWeight: timer != 0
                                        ? FontWeight.w500
                                        : FontWeight.w800,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      if (timer == 0) {
                                        setState(() {
                                          loading = true;
                                        });
                                        await OTPService().sendOTP(
                                          widget.phoneNumber,
                                          context,
                                          true,
                                          stopLoading: () {
                                            setState(() {
                                              loading = false;
                                            });
                                          },
                                        );
                                      }
                                    },
                                ),
                                timer != 0
                                    ? TextSpan(
                                        text: " in $timer seconds",
                                        style: TextStyle(
                                          color: Colors.deepOrange.shade700,
                                        ),
                                      )
                                    : TextSpan(),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Builder otpFields(BuildContext context) {
    return Builder(builder: (context) {
      return PinCodeTextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 6,

        animationType: AnimationType.scale,
        autoFocus: true,

        validator: (v) {
          return null;
        },

        cursorColor: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        textStyle: TextStyle(fontSize: 20, height: 1.6),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: teal,
          activeFillColor: Colors.transparent,
          inactiveColor: teal,
          inactiveFillColor: Colors.transparent,
          selectedColor: teal,
          selectedFillColor: Colors.transparent,
        ),

        onCompleted: (v) async {
          setState(() {
            loading = true;
          });
          AuthCredential credential = PhoneAuthProvider.credential(
              verificationId: widget.verID, smsCode: otpString);
          await OTPService().signInWithCred(credential, context, () {
            textEditingController.clear();
            setState(() {
              loading = false;
            });
          });
        },

        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          print(value);
          setState(() {
            otpString = value;
          });
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return false;
        },
      );
    });
  }
}
