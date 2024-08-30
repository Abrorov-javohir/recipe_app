import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/user/user.dart';
import 'package:recipe_app/ui/screens/edit_profile_screen.dart';
import 'package:recipe_app/ui/screens/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user; // Initialize user
  }

  void _updateUser(User updatedUser) {
    setState(() {
      _user = updatedUser; // Update user with new data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Profile Card at the top
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile_bacground.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _user.photo != null
                      ? FileImage(File(_user.photo!))
                      : null,
                  child:
                      _user.photo == null ? const Icon(Icons.camera_alt) : null,
                ),
                const SizedBox(height: 10),
                // Name
                Text(
                  _user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                // Location
                const Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () async {
                        final updatedUser = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditProfileScreen(user: _user),
                          ),
                        );
                        if (updatedUser != null) {
                          _updateUser(updatedUser); // Update user if not null
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () async {
                        final updatedUser = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(user: _user),
                          ),
                        );
                        if (updatedUser != null) {
                          _updateUser(updatedUser); // Update user if not null
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Spacer to fill the remaining space
          const Spacer(),
        ],
      ),
    );
  }
}
