import 'package:flutter/material.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  @override
  State<MoodSelectionScreen> createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  // Track the selected mood
  String? selectedMood;

  final List<Map<String, String>> moods = [
    {'label': 'Drained', 'emoji': '😫'},
    {'label': 'Low', 'emoji': '😔'},
    {'label': 'Neutral', 'emoji': '😐'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Question 2 of 16',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Question Text
            const Text(
              'Over the past week, how would\nyou describe your overall energy\nand mood?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 60),
            // Mood Options Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: moods.map((mood) {
                bool isSelected = selectedMood == mood['label'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = mood['label'];
                    });
                  },
                  child: Column(
                    children: [
                      // Emoji Container
                      Text(
                        mood['emoji']!,
                        style: const TextStyle(fontSize: 64),
                      ),
                      const SizedBox(height: 12),
                      // Label
                      Text(
                        mood['label']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                onPressed: selectedMood != null ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C2C2E),
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}