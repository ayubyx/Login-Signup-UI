import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/components/custom_button.dart';
import 'package:nft_app/components/textformfield.dart';
import 'package:nft_app/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: media.width * 0.1),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: media.width * 0.05),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Sign Up and Find, Collect and Create your Best ",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.black, fontSize: 14),
                        ),
                        TextSpan(
                          text: "NFTs",
                          style: GoogleFonts.aBeeZee(
                              color: const Color.fromARGB(255, 0, 0, 255),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: media.width * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-Mail",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormTile(
                        isObscured: false,
                        text: "Enter an Email",
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter an email";
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: media.width * 0.09,
                      ),
                      Text(
                        "Mobile",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormTile(
                        isObscured: false,
                        text: "Enter Mobile Number",
                        controller: _mobileController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a mobile number";
                          }
                          return null;
                        },
                        type: TextInputType.phone,
                      ),
                      SizedBox(
                        height: media.width * 0.09,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextFormTile(
                          isObscured: _isObscured,
                          text: "Enter Password",
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a password";
                            } else if (value < 6) {
                              return "password is too short!";
                            }
                            return null;
                          },
                          type: TextInputType.text,
                          rightIcon: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                child: Image.asset(_isObscured
                                    ? "images/show_pwd_icon.png"
                                    : "images/hide_pwd_icon.png"),
                              ))),
                    ],
                  )),
            ),
            SizedBox(height: media.width * 0.09),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "By signing up you are agreeing to our",
                      style: GoogleFonts.aBeeZee(color: Colors.grey)),
                  TextSpan(
                    text: " Terms & \ncondotions ",
                    style: GoogleFonts.aBeeZee(
                        color: const Color.fromARGB(255, 0, 0, 255)),
                  ),
                  TextSpan(
                      text: "and ",
                      style: GoogleFonts.aBeeZee(color: Colors.grey)),
                  TextSpan(
                    text: "Privacy Policy",
                    style: GoogleFonts.aBeeZee(
                        color: const Color.fromARGB(255, 0, 0, 255)),
                  ),
                ],
              ),
            ),
            SizedBox(height: media.width * 0.1),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  null;
                }
              },
              text: "SIGN UP",
            ),
            SizedBox(height: media.width * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
