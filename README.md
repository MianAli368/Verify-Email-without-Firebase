# email_verification_without_firebase

// Add Package
email_otp: ^1.0.4


// Import 
import 'package:email_otp/email_otp.dart';



// Create Object
EmailOTP myauth = EmailOTP();




// Creating Text Fields.
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();



// Configure Object
myauth.setConfig(
                            appEmail: "me@rohitchouhan.com",
                            appName: "Email OTP",
                            userEmail: email.text,
                            otpLength: 6,
                            otpType: OTPType.digitsOnly
                          );



// Check OTP has sent or not.
 if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }




// Complete send OTP Button Code
ElevatedButton(
                        onPressed: () async {
                          myauth.setConfig(
                            appEmail: "me@rohitchouhan.com",
                            appName: "Email OTP",
                            userEmail: email.text,
                            otpLength: 6,
                            otpType: OTPType.digitsOnly
                          );
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),




// Check OTP verified or not
if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }




// Complete OTP Verification button Code
ElevatedButton(
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        },
                        child: const Text("Verify")),

