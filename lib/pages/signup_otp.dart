

import 'dart:async';

import 'package:flutter/material.dart';

import 'personal_details.dart';

class OTPBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  OTPBox({required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class SignupStepTwoPage extends StatefulWidget {
  final String phoneNumber;

  SignupStepTwoPage({required this.phoneNumber});

  @override
  _SignupStepTwoPageState createState() => _SignupStepTwoPageState();
}

class _SignupStepTwoPageState extends State<SignupStepTwoPage> {
  late List<TextEditingController> otpControllers;
  late List<FocusNode> otpFocusNodes;

  int countdown = 120;
  bool isResendActive = false;

  @override
  void initState() {
    otpControllers = List.generate(4, (index) => TextEditingController());
    otpFocusNodes = List.generate(4, (index) => FocusNode());
    startCountdown();
    super.initState();
  }

  void startCountdown() {
    setState(() {
      countdown = 120;
      isResendActive = false;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        setState(() {
          isResendActive = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    otpControllers.forEach((controller) => controller.dispose());
    otpFocusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFDF5),
      appBar: AppBar(
        title: Text('Signup Step 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Signup Step 2',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Enter the OTP sent to:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  widget.phoneNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: OTPBox(
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform submit action
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetupAccountPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              isResendActive
                  ? ElevatedButton(
                      onPressed: () {
                        // Perform resend action
                        startCountdown();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Text(
                      'Resend OTP in ${countdown.toString()} seconds',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
