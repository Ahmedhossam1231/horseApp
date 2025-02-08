import 'package:flutter/material.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimalIconScreen(),
    );
  }
}

class AnimalIconScreen extends StatelessWidget {
  const AnimalIconScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFF0D9), // لون الخلفية
        child: Center(
          child: Container(
            width: 200, // حجم الدائرة
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xFFD39E6B), // لون الدائرة
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.pets, // أيقونة الحيوان
                size: 60, // حجم الأيقونة
                color: Colors.white, // لون الأيقونة
              ),
            ),
          ),
        ),
      ),
    );
  }
}
