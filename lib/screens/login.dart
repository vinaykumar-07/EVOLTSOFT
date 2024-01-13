import 'package:assignment/screens/otp.dart';
import 'package:assignment/widget/big_text.dart';
import 'package:assignment/widget/small_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String verify = "";

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back),
              const SizedBox(height: 20),
              BigText(
                text: "Log in",
                size: 35,
              ),
              const SizedBox(height: 10),
              SmallText(
                text:
                    "We'll send you a code- it keeps us keep your account secure.",
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: "Country code",
                        size: 18,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 90,
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 400),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                },
                              );
                            },
                            child: SmallText(
                              text:
                                  "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SmallText(
                          text: "    Phone number",
                          size: 18,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(left: 10, top: 5),
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            controller: phoneController,
                            onChanged: (value) {
                              setState(() {
                                phoneController.text = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number Here...",
                              border: InputBorder.none,
                              suffixIcon: phoneController.text.length > 11
                                  ? Container(
                                      height: 25,
                                      margin: const EdgeInsets.all(10),
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //Send Code button
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber:
                          "+${selectedCountry.phoneCode}${phoneController.text}",
                       
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        // Automatically sign in the user on Android
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print(
                            "+${selectedCountry.phoneCode}${phoneController.text}");
                        print('Verification failed: $e');
                      },
                      codeSent: (verificationId, forceResendingToken) {
                        LoginScreen.verify = verificationId;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyOtp(),
                        ));
                        // Store the verification ID somewhere

                        // You'll need it later to complete the verification
                        print('Verification ID: $verificationId');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        // Auto-retrieve timed out
                        print('Verification ID: $verificationId');
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0488F5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: BigText(
                    text: "Send code",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
