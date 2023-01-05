














import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lime),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // creating object of AuthEmail.
  late EmailAuth emailAuth;
  // Method to Send OTP on Email
  void sendOTP() async {
    emailAuth.sessionName = "Industry Mall";
    var res = await emailAuth.sendOtp(recipientMail: emailController.text);
    if (res) {
      print("OTP Sent");
    } else {
      print("OTP could not sent");
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: otpController.text);
    if (res) {
      print("OTP Verified");
    } else {
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Email verification through OTP"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  sendOTP();
                },
                child: Text("Send OTP")),
            SizedBox(
              height: 20,
            ),
            Text(
              "OTP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  verifyOTP();
                },
                child: Text("Send OTP")),
          ],
        ),
      ),
    );
  }
}
