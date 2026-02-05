import 'package:flutter/material.dart';
import '../widgets/continue_button.dart';

class LearningPreferenceScreen extends StatefulWidget {
  const LearningPreferenceScreen({super.key});

  @override
  State<LearningPreferenceScreen> createState() =>
      _LearningPreferenceScreenState();
}

class _LearningPreferenceScreenState extends State<LearningPreferenceScreen> {
  double sliderValue = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Question 12 of 16",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "How do you prefer to learn and engage with new wellbeing tools?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Guided"), Text("Exploratory")],
            ),

            Slider(
              value: sliderValue,
              onChanged: (v) => setState(() => sliderValue = v),
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
            ),

            const Spacer(),
            ContinueButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
