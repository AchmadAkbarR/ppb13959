import 'package:flutter/material.dart';
import 'daftar_game.dart'; // Halaman Now Showing
import '../services/auth_service.dart';
import 'login_page.dart';
import 'edit_profile.dart'; // Halaman Profile
import 'package:cloud_firestore/cloud_firestore.dart'; // Pastikan Firebase Firestore diimpor

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text(
          "Game Menu",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false, // Hapus semua rute sebelumnya
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 213, 214, 229), const Color.fromARGB(255, 232, 240, 244)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Enjoyy !!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.white54,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.gamepad,
                    title: "List Game",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TayangPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  _buildFeatureCard(
                    context,
                    icon: Icons.account_circle,
                    title: "Edit Profile",
                    onTap: () async {
                      var userDoc = await FirebaseFirestore.instance.collection('users').doc(AuthService.currentUser!.uid).get();
                      var userData = userDoc.data();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            initialName: userData?['name'] ?? '',
                            initialEmail: userData?['email'] ?? AuthService.currentUser?.email ?? '',
                            initialPhone: userData?['phone'] ?? '',
                            onSave: (name, email, phone) async {
                              await FirebaseFirestore.instance.collection('users').doc(AuthService.currentUser!.uid).set({
                                'name': name,
                                'email': email,
                                'phone': phone,
                              }, SetOptions(merge: true));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Profile updated successfully!")),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: const Color.fromARGB(255, 249, 250, 250),
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
