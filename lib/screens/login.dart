import 'package:flutter/material.dart';
import '../components/login_/button.dart';
import '../components/login_/facebook_login_button.dart';
import '../components/login_/input.dart';
import '../components/login_/learn_more_text.dart';
import '../components/login_/privacy_policy_text.dart';
import '../components/login_/separator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileOrEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  bool isLoading = false;
  bool fbIsLoading = false;

  final helperTextColor = const Color.fromARGB(221, 225, 227, 228);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              children: [
                // Instagram logo
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 0.0),
                  child: Image.asset(
                    'assets/images/instagram_logo.png',
                    width: 200,
                    height: 70,
                  ),
                ),

                // Sign-up instructions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign up to see photos and videos from your friends',
                        style: TextStyle(
                          color: Colors.black87,
                          letterSpacing: 0.8,
                          fontSize: 17 ,
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.bold,

                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Facebook Login Button
                      FacebookLoginButton(
                        isLoading: fbIsLoading,
                          onPressed: () async {
                            setState(() {
                              fbIsLoading = true;
                            });
                            await signUp();
                            setState(() {
                              fbIsLoading = false;
                            });
                          },
                      ),
                      const OrSeparator(),

                      // Mobile or Email input
                      InputField(
                        controller: _mobileOrEmailController,
                        labelText: 'Mobile number or email address',
                        isObscure: false,
                      ),
                      const SizedBox(height: 20),

                      // Password input
                      InputField(
                        controller: _passwordController,
                        labelText: 'Password',
                        isObscure: true,
                      ),
                      const SizedBox(height: 20),

                      // Full Name input
                      InputField(
                        controller: _fullNameController,
                        labelText: 'Full Name',
                        isObscure: false,
                      ),
                      const SizedBox(height: 10),

                      // User Name input
                      InputField(
                        controller: _userNameController,
                        labelText: 'Username',
                        isObscure: false,
                      ),


                      // Terms & Conditions and Privacy text
                      const SizedBox(height: 10),
                      //learn more text
                      const LearnMoreText(),
                      const SizedBox(height: 10),

                      //privacy terms text
                      const PrivacyPolicyText(),

                      const SizedBox(height: 20),

                      // Sign-up Button
                      SignUpButton(
                        isLoading: isLoading,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await signUp();
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    String mobileOrEmail = _mobileOrEmailController.text;
    String password = _passwordController.text;
    String fullName = _fullNameController.text;
    String username = _userNameController.text;

    await Future.delayed(const Duration(seconds: 2));
    print('Signed up with: $mobileOrEmail, $password, $fullName, $username');
  }
}
