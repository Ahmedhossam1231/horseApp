import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:horse/profile_view0.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenPagee(),
    );
  }
}

class HomeScreenPagee extends StatelessWidget {
  const HomeScreenPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE4AB6E),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF8A5D3B),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(Icons.pets, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/horse_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No horses added yet!',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8A5D3B),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileView()),
                    );
                  },
                  child: const Text(
                    "Add New Horse",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
