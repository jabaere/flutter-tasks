import 'package:flutter/material.dart';
import 'package:taskone/screens/home.dart';
import '../components/login_/button.dart';
import '../components/profile/profile_settings.dart';
import 'login.dart';
import '../models.dart';
import '../objectbox.g.dart';

class ProfileScreen extends StatefulWidget {
  final Store store;
  final int userId;

  const ProfileScreen({super.key, required this.store, required this.userId});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  late Box<User> _userBox;
  late User _user;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _userBox = widget.store.box<User>();
    _user = _userBox.get(widget.userId)!; // Fetch user from ObjectBox
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          padding: const EdgeInsets.only(left: 20.0),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(store: widget.store, userId: widget.userId,),
              ),
            );
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded),
              color: Colors.black,
              onPressed: () async {

                print('Logged out');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(store: widget.store),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              children: [
                // Profile Section
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

                      Text(
                        _user.name ?? 'No Name',  // Fallback if name is null
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        "@${_user.mobile ?? 'Unknown'}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      DefaultButton(
                        isLoading: isLoading,
                        onPressed: () {
                          // Handle edit profile
                          _editProfile();
                        },
                        title: "Edit Profile",
                        bgColor: Colors.grey[100],
                        txtColor: Colors.black54,
                        borderColor: Colors.black26,
                        btnWidth: 170,
                        borderRadius: 15,
                      ),
                      const SizedBox(height: 50),
                      // Profile Settings Section
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
                                // onPressed: () {
                                //   // Navigate to settings screen
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => ProfileSettingsScreen(user: _user),
                                //     ),
                                //   );
                                // },
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  handle edit profile functionality
  void _editProfile() {

    print("Edit profile clicked");

  }
}
