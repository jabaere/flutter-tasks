import 'package:flutter/material.dart';
import '../components/login_/button.dart';
import '../components/login_/facebook_login_button.dart';
import '../components/login_/input.dart';
import '../components/login_/learn_more_text.dart';
import '../components/login_/privacy_policy_text.dart';
import '../components/login_/separator.dart';
import '../models.dart';
import 'home.dart';
import '../objectbox.g.dart';



class SignUpScreen extends StatefulWidget {
  final Store store;

  const SignUpScreen({super.key, required this.store});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _mobileOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  bool isLoading = false;
  bool fbIsLoading = false;

  late Box<User> _userBox;

  @override
  void initState() {
    super.initState();
    _userBox = widget.store.box<User>();
  }

  @override
  void dispose() {

    _mobileOrEmailController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
    _locationController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

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
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 0.0),
                  child: Image.asset(
                    'assets/images/instagram_logo.png',
                    width: 200,
                    height: 70,
                  ),
                ),
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
                          fontSize: 17,
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      FacebookLoginButton(
                        isLoading: fbIsLoading,
                        onPressed: () async {
                          setState(() => fbIsLoading = true);
                          await signUp(context);
                          setState(() => fbIsLoading = false);
                        },
                      ),
                      const OrSeparator(),
                      InputField(
                        controller: _mobileOrEmailController,
                        labelText: 'Mobile number or email address',
                        isObscure: false,
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        controller: _passwordController,
                        labelText: 'Password',
                        isObscure: true,
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        controller: _confPasswordController,
                        labelText: 'Confirm Password',
                        isObscure: true,
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        controller: _locationController,
                        labelText: 'Location',
                        isObscure: false,
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        controller: _userNameController,
                        labelText: 'Username',
                        isObscure: false,
                      ),
                      const SizedBox(height: 10),
                      const LearnMoreText(),
                      const SizedBox(height: 10),
                      const PrivacyPolicyText(),
                      const SizedBox(height: 20),
                      DefaultButton(
                        isLoading: isLoading,
                        title: 'Sign Up',
                        bgColor: Colors.blue,
                        txtColor: Colors.white,
                        borderRadius: 5,
                        borderColor: Colors.blue,
                        btnWidth: 300,
                        onPressed: () async {
                          setState(() => isLoading = true);
                          await signUp(context);
                          setState(() => isLoading = false);
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

  Future<void> signUp(BuildContext context) async {
    String mobileOrEmail = _mobileOrEmailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confPasswordController.text;
    String location = _locationController.text.trim();
    String username = _userNameController.text.trim();

    if (mobileOrEmail.isEmpty || password.isEmpty || confirmPassword.isEmpty || location.isEmpty || username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All fields are required')));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords do not match!')));
      return;
    }

    final user = User(mobile: mobileOrEmail, password: password, location: location, name: username);

    try {
      int id = await _userBox.put(user); // Save user to ObjectBox

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(userId:id,store: widget.store)));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error signing up user. Please try again later.')));
    }
  }
}