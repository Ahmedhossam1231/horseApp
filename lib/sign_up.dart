import 'package:flutter/material.dart';
import 'package:horse/home_page.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/hrs.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromRGBO(132, 84, 50, 1),
                  child: Icon(
                    Icons.pets,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField("User name"),
                const SizedBox(height: 10),
                _buildTextField("E-mail"),
                const SizedBox(height: 10),
                _buildTextField("Password", obscureText: true),
                const SizedBox(height: 10),
                _buildTextField("Confirm password", obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreenPagee()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(132, 84, 50, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(
                        Icons.g_mobiledata_rounded,
                      ),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color.fromRGBO(132, 84, 50, 1).withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
