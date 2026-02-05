import 'package:flutter/material.dart';

class SupportLevelScreen extends StatefulWidget {
  const SupportLevelScreen({Key? key}) : super(key: key);

  @override
  State<SupportLevelScreen> createState() => _SupportLevelScreenState();
}

class _SupportLevelScreenState extends State<SupportLevelScreen> {
  double _value = 3;

  final List<String> emojis = [
    "😟",
    "😔",
    "😄",
    "🙂",
    "🥰",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How supported do you feel\nin your personal life?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 40),

            /// Emojis row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: emojis.asMap().entries.map((entry) {
                final index = entry.key + 1;
                final emoji = entry.value;
                final isActive = _value.round() == index;

                return AnimatedScale(
                  scale: isActive ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            /// Slider
            Slider(
              value: _value,
              min: 1,
              max: 5,
              divisions: 4,
              activeColor: Colors.black,
              inactiveColor: Colors.grey.shade300,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
            ),

            /// Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "I feel\nalone",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "3",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "4",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "I have strong\nsupport",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),

            const Spacer(),

            /// Continue button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: navigate to next screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
