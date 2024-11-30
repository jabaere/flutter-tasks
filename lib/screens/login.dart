import 'package:flutter/material.dart';
import '../components/login_/button.dart';
import '../components/login_/input.dart';
import '../models.dart';
import '../objectbox.g.dart';
import 'home.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  final Store store; // Store passed from main.dart

  const LoginScreen({super.key, required this.store});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Box<User> _userBox;

  bool signUpisLoading = false;
  bool signinisLoading = false;

  @override
  void initState() {
    super.initState();
    _userBox = widget.store.box<User>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signIn(BuildContext context) async {
    String mobileOrEmail = _mobileOrEmailController.text.trim();
    String password = _passwordController.text.trim();

    if (mobileOrEmail.isEmpty || password.isEmpty) {
      _showError("Please fill in all fields");
      return;
    }

    final query = _userBox.query(
      User_.mobile.equals(mobileOrEmail),
    ).build();

    final user = query.findFirst();
    query.close();

    if (user == null || user.password != password) {
      _showError("Invalid email or password");
      return;
    }

    // Navigate to HomeScreen if credentials are valid
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(userId: user.id,store: widget.store),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(store: widget.store),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.white))),
    );
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
                    children: [
                      const Text(
                        'Log in to see photos and videos from your friends',
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
                      DefaultButton(
                        isLoading: signinisLoading,
                        title: 'Log in',
                        bgColor: Colors.blue,
                        txtColor: Colors.white,
                        borderRadius: 5,
                        borderColor: Colors.blue,
                        btnWidth: 300,
                        onPressed: () async {
                          setState(() => signinisLoading = true);
                          await signIn(context); // Call sign-in method
                          setState(() => signinisLoading = false);
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => signUp(context),
                        child: const Text(
                          'Don’t have an account? Sign up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
}
