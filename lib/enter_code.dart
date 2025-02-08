import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horse/new_pass.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CodeEntryScreen(),
    );
  }
}

class CodeEntryScreen extends StatelessWidget {
  const CodeEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A432C),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/hrs.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Logo
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color.fromRGBO(132, 84, 50, 1),
                    child: Icon(
                      Icons.pets,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Enter code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(132, 84, 50, 1)
                                .withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPasswordScreen(),
                        ),
                      );
                      if (kDebugMode) {
                        print("LOGIN button pressed");
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(132, 84, 50, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Send code again',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
