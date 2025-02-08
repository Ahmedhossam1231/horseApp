import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horse/enter_ur_email.dart';
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
      home: Sign_upPage(),
    );
  }
}

// ignore: camel_case_types
class Sign_upPage extends StatelessWidget {
  const Sign_upPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A432C),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/hrs.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circle Avatar
                  const CircleAvatar(
                    radius: 90,
                    backgroundColor: Color.fromRGBO(132, 84, 50, 1),
                    backgroundImage: AssetImage("images/hrs.jpg"),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    'Welcome back nice to see you again ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(228, 171, 110, 0.44),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(228, 171, 110, 0.44),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HorseInfoApp()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(132, 84, 50, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreenPagee(),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'forget the password ? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmailScreen(),
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
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "get it now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
