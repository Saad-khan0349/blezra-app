import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 🔸 Top Profile Section
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/pngs/profile2.jpeg'),
                ),
                SizedBox(height: 15),
                Text(
                  'Saad Khan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'K.saad55551@gmail.com',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // 🟠 Edit Profile Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent, // orange background
              foregroundColor: Colors.white, // white text
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              // TODO: Add your edit profile action here
            },
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          // ⚪ Logout Button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white, // white background
              foregroundColor: Colors.green, // green text
              side: const BorderSide(color: Colors.deepOrangeAccent),
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              // TODO: Add your logout action here
            },
            child: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
