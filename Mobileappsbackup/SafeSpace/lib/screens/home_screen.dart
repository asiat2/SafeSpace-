import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import 'panic_screen.dart';
import 'breathe_screen.dart';
import 'mood_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F7),

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SafeSpace',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Image.asset('assets/icon/safespace_logo.png', height: 120),

            const SizedBox(height: 15),

            const Text(
              "Your calm place anytime, anywhere.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 30),

            const Text(
              "How are you feeling right now?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),

            const SizedBox(height: 25),

            // PANIC RELIEF
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    CustomButton(
                      text: "Panic Relief",
                      icon: Icons.favorite,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PanicScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Quick support when you're feeling overwhelmed.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BREATHING
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CustomButton(
                      text: "Breathing Exercise",
                      icon: Icons.air,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BreatheScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Guided breathing sessions to help you relax.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MOOD CHECK
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CustomButton(
                      text: "Mood Check",
                      icon: Icons.emoji_emotions,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const MoodScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Reflect on how you're feeling today.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
