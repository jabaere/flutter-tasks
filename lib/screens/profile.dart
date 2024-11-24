import 'package:flutter/material.dart';

import '../components/login_/button.dart';
import '../components/profile/profile_settings.dart';
import 'login.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<ProfileScreen> {
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
        backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
        iconTheme: const IconThemeData(color: Colors.black),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
            padding: const EdgeInsets.only( left:20.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only( right:20.0),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded),
              color: Colors.black,
              onPressed: () async {


                print('Logged out');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
            ),
          )

    ]
        ),

      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              children: [

           Center(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                   child: SizedBox(
                     width: 300,
                     height: 110,
                     child: Image.asset(
                       'assets/images/profile.png',
                       fit: BoxFit.contain,
                     ),
                   ),
                 ),

                 const SizedBox(height: 10),
                 const Text("Wu Liuqi"),
                 const SizedBox(height: 10),
                 const Text("@7", style: TextStyle(color: Colors.grey)),
                 const SizedBox(height: 10),
                 DefaultButton(
                   isLoading: false,
                   onPressed: (){},
                   title: "Edit Profile",
                   bgColor: Colors.grey[100],
                   txtColor: Colors.black54,
                   borderColor: Colors.black26,
                   btnWidth: 170,
                   borderRadius: 15,
                 ),

                 const SizedBox(height: 50),
                 Container(
                   constraints: BoxConstraints(
                     maxWidth: screenSize.width,
                     minHeight: 0,
                     maxHeight: screenSize.height,
                   ),
                   decoration: const BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(25.0),
                       topRight: Radius.circular(25.0),
                     ),
                   ),
                   child: const Padding(
                     padding: EdgeInsets.only(top: 30.0, bottom: 50),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         CustomRowComponent(
                           icon: Icons.verified_user_outlined,
                           text: 'Verification',
                           showCheckMark: true,
                         ),
                         CustomRowComponent(
                           icon: Icons.settings,
                           text: 'Settings',
                           showCheckMark: false,
                         ),
                         CustomRowComponent(
                           icon: Icons.lock_rounded,
                           text: 'Change password',
                           showCheckMark: false,
                         ),
                         CustomRowComponent(
                           icon: Icons.card_giftcard,
                           text: 'Refer friends',
                           showCheckMark: false,
                         ),
                       ],
                     ),
                   ),
                 ),


               ],

             ),

           ),

    ]),
          ),
        ),
      ),
    );














  }

  // Future<void> signUp(context) async {
  //   String mobileOrEmail = _mobileOrEmailController.text;
  //   String password = _passwordController.text;
  //   String fullName = _fullNameController.text;
  //   String username = _userNameController.text;
  //
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const SongScreen(song: song),
  //     ),
  //   );
  // }
}
