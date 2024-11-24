import 'package:flutter/material.dart';
import '../components/login_/button.dart';
import '../components/login_/input.dart';
import 'home.dart';
import 'sign_up.dart';


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

  bool signUpisLoading = false;
  bool signinisLoading = false;
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

                      // Sign-up Button
                      DefaultButton(
                        isLoading: signinisLoading,
                        title: 'Log In',
                        bgColor: Colors.blue,
                        txtColor: Colors.white,
                        borderRadius: 5,
                        borderColor: Colors.blue,
                        btnWidth: 300,
                        onPressed: () async {
                          setState(() {
                            signinisLoading = true;
                          });
                          await signIn(context);
                          setState(() {
                            signinisLoading = false;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      DefaultButton(
                        isLoading: signUpisLoading,
                        title: 'Sign Up',
                        bgColor: Colors.blue,
                        txtColor: Colors.white,
                        borderRadius: 5,
                        borderColor: Colors.blue,
                        btnWidth: 300,
                        onPressed: () async {
                          setState(() {
                            signUpisLoading = true;
                          });
                          await signUp(context);
                          setState(() {
                            signUpisLoading = false;
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

  Future<void> signIn(context) async {
    String mobileOrEmail = _mobileOrEmailController.text;
    String password = _passwordController.text;
    String fullName = _fullNameController.text;
    String username = _userNameController.text;

    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  Future<void> signUp(context) async {


    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}
