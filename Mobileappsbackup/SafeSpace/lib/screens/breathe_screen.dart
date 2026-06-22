import 'dart:async';
import 'package:flutter/material.dart';
import 'mood_screen.dart';

class BreatheScreen extends StatefulWidget {
  const BreatheScreen({super.key});

  @override
  State<BreatheScreen> createState() => _BreatheScreenState();
}

class _BreatheScreenState extends State<BreatheScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  Timer? _timer;

  int selectedMinutes = 1;
  int remainingSeconds = 60;

  bool isRunning = false;

  final List<String> breathingSteps = ["Inhale", "Hold", "Exhale", "Hold"];

  int currentStep = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 120, end: 220).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.repeat(reverse: true);
    _animationController.stop();
  }

  void startSession() {
    if (isRunning) return;

    setState(() {
      isRunning = true;
    });

    _animationController.repeat(reverse: true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;

          if (remainingSeconds % 4 == 0) {
            currentStep = (currentStep + 1) % breathingSteps.length;
          }
        });
      } else {
        timer.cancel();
        completeSession();
      }
    });
  }

  void pauseSession() {
    _timer?.cancel();
    _animationController.stop();

    setState(() {
      isRunning = false;
    });
  }

  void stopSession() {
    _timer?.cancel();

    _animationController.stop();

    setState(() {
      isRunning = false;
      currentStep = 0;
      remainingSeconds = selectedMinutes * 60;
    });
  }

  void completeSession() {
    _animationController.stop();

    setState(() {
      isRunning = false;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("🎉 Session Complete"),
          content: const Text(
            "Well done!\nYou completed your breathing session.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  remainingSeconds = selectedMinutes * 60;
                  currentStep = 0;
                });
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  String formatTime() {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget buildTimeButton(int minutes) {
    return ElevatedButton(
      onPressed: () {
        if (!isRunning) {
          setState(() {
            selectedMinutes = minutes;
            remainingSeconds = minutes * 60;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedMinutes == minutes
            ? Colors.blue
            : Colors.grey.shade300,
      ),
      child: Text(
        '$minutes Min',
        style: TextStyle(
          color: selectedMinutes == minutes ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F7),
      appBar: AppBar(
        title: const Text("Breathing Exercise"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose Session Length",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTimeButton(1),
                buildTimeButton(3),
                buildTimeButton(5),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              breathingSteps[currentStep],
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 25,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            Text(
              formatTime(),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: startSession,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Start"),
                ),

                ElevatedButton.icon(
                  onPressed: pauseSession,
                  icon: const Icon(Icons.pause),
                  label: const Text("Pause"),
                ),

                ElevatedButton.icon(
                  onPressed: stopSession,
                  icon: const Icon(Icons.stop),
                  label: const Text("Stop"),
                ),
              ],
            ),

            const SizedBox(height: 20),

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
                      MaterialPageRoute(builder: (_) => const MoodScreen()),
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
