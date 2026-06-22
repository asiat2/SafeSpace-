import 'package:flutter/material.dart';
import 'relax_screen.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  void showMessage(BuildContext context, String mood, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(mood),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget moodCard(
    BuildContext context,
    String emoji,
    String title,
    String message,
  ) {
    return Card(
      child: ListTile(
        leading: Text(emoji, style: const TextStyle(fontSize: 30)),
        title: Text(title),
        onTap: () {
          showMessage(context, title, message);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F7),
      appBar: AppBar(title: const Text("Mood Check"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "How are you feeling today?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            moodCard(
              context,
              "😊",
              "Great",
              "Keep sharing your positive energy.",
            ),

            moodCard(context, "🙂", "Good", "Keep taking care of yourself."),

            moodCard(
              context,
              "😐",
              "Okay",
              "One step at a time. You've got this.",
            ),

            moodCard(context, "😔", "Sad", "It's okay to have difficult days."),

            moodCard(
              context,
              "😟",
              "Anxious",
              "Take a deep breath. Focus on this moment.",
            ),

            moodCard(
              context,
              "😭",
              "Overwhelmed",
              "Pause. Breathe. You don't need to solve everything today.",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RelaxScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
