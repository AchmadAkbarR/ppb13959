import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  ProfilePage({
    Key? key,
    required String initialName,
    required String initialEmail,
    required String initialPhone,
    required this.onSave,
  })  : nameController = TextEditingController(text: initialName),
        emailController = TextEditingController(text: initialEmail),
        phoneController = TextEditingController(text: initialPhone),
        super(key: key);

  final Function(String name, String email, String phone) onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 247, 244),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: const Color.fromARGB(255, 3, 15, 241),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input: Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),

            // Input: Email (read-only)
            TextField(
              controller: emailController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),

            // Input: Phone
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 24),

            // Save Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final phone = phoneController.text.trim();

                  if (name.isEmpty || phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Name and phone are required"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  onSave(name, email, phone);
                  Navigator.pop(context);
                },
                child: Text(
                  "Save Profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
