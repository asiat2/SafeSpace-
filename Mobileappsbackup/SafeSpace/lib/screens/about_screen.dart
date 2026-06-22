import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F7),

      appBar: AppBar(
        title: const Text("About SafeSpace"),
        centerTitle: true,
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "SafeSpace",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your calm place anytime, anywhere.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 30),

            const Text(
              "SafeSpace is a wellness and mindfulness app designed to help users relax, reduce stress, and improve emotional well-being.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            const Text(
              "This app is not intended to diagnose, treat, or replace professional medical care.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 30),

            const Text(
              "Version 1.0",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 5),

            const Text(
              "Built with ❤️ for mental wellness",
              style: TextStyle(color: Colors.grey),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Previous"),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Home"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
