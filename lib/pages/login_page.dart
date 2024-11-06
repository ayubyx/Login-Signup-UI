import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app/components/custom_button.dart';
import 'package:nft_app/components/textformfield.dart';
import 'package:nft_app/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
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
          SizedBox(
            height: media.width * 0.1,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "Hello,",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 255)
                          .withOpacity(0.7)),
                ),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: media.width * 0.2),
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
                      text: "E-mail",
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
          SizedBox(height: media.width * 0.05),
          Text(
            "Forgot Password?",
            style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.black),
          ),
          SizedBox(height: media.width * 0.1),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                null;
              }
            },
            text: "Log In",
          ),
          SizedBox(height: media.width * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: Row(
              children: [
                const Expanded(child: Divider()),
                const SizedBox(width: 5),
                Text("OR LOGIN WITH",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                const SizedBox(width: 5),
                const Expanded(child: Divider()),
              ],
            ),
          ),
          SizedBox(height: media.width * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/apple_logo.png",
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 29),
              Image.asset(
                "images/google-logo.png",
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 20),
              Image.asset(
                "images/Facebook-logo.png",
                width: 50,
                height: 50,
              ),
            ],
          ),
          SizedBox(height: media.width * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New to PETE?",
                style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ],
      ),
    )));
  }
}
