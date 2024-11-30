import 'package:flutter/material.dart';
import 'package:taskone/screens/profile.dart';
import '../objectbox.g.dart';
import '../models.dart';

class HomeScreen extends StatefulWidget {
  final int userId; // User ID to fetch the specific user
  final Store store; // ObjectBox store to access the database

  const HomeScreen({super.key, required this.userId, required this.store});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Box<User> _userBox;
  User? _currentUser;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _userBox = widget.store.box<User>();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    setState(() {
      _currentUser = _userBox.get(widget.userId); // Fetch the user by ID
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, User ID: ${widget.userId}'),
            const SizedBox(height: 10),
            if (_currentUser != null) ...[
              Text('Name: ${_currentUser!.name ?? 'N/A'}'),
              Text('Mobile: ${_currentUser!.mobile}'),
              Text('Location: ${_currentUser!.location}'),
            ] else
              const Text('User not found!'),
          ],
        ),
      ),
      ProfileScreen(store: widget.store, userId: widget.userId),
    ];

    return Scaffold(

      body: pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
