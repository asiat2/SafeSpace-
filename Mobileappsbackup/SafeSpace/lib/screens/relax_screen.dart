import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'about_screen.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  final AudioPlayer player = AudioPlayer();

  String currentSound = "No sound selected";
  @override
  void initState() {
    super.initState();
    player.setVolume(1.0);
  }

  Future<void> playSound(String fileName, String soundName) async {
    await player.stop();

    await player.setVolume(1.0);

    await player.play(AssetSource('sounds/$fileName'));

    setState(() {
      currentSound = soundName;
    });
  }

  Future<void> pauseSound() async {
    await player.pause();
  }

  Future<void> stopSound() async {
    await player.stop();

    setState(() {
      currentSound = "No sound selected";
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F7),
      appBar: AppBar(title: const Text("Relax Sounds"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Choose a relaxing sound",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              currentSound,
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.water_drop),
              title: const Text("Rain"),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                playSound("rain.mp3", "Rain");
              },
            ),

            ListTile(
              leading: const Icon(Icons.waves),
              title: const Text("Ocean"),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                playSound("ocean.mp3", "Ocean");
              },
            ),

            ListTile(
              leading: const Icon(Icons.park),
              title: const Text("Forest"),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                playSound("forest.mp3", "Forest");
              },
            ),

            ListTile(
              leading: const Icon(Icons.graphic_eq),
              title: const Text("White Noise"),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                playSound("white_noise.mp3", "White Noise");
              },
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    pauseSound();
                  },
                  icon: const Icon(Icons.pause),
                  label: const Text("Pause"),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    stopSound();
                  },
                  icon: const Icon(Icons.stop),
                  label: const Text("Stop"),
                ),
              ],
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
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
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
