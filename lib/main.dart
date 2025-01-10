import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pastikan Firebase diinisialisasi dengan benar
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaming House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Gunakan warna terang untuk background
      ),
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pastikan kita memeriksa apakah user sudah login
    return AuthService.currentUser != null ? HomePage() : LoginPage();
  }
}