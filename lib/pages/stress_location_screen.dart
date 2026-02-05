import 'package:flutter/material.dart';
import '../widgets/option_tile.dart';
import '../widgets/continue_button.dart';

class StressLocationScreen extends StatefulWidget {
  const StressLocationScreen({super.key});

  @override
  State<StressLocationScreen> createState() => _StressLocationScreenState();
}

class _StressLocationScreenState extends State<StressLocationScreen> {
  final List<String> options = [
    "At my work / school",
    "In meetings or class",
    "During commute",
    "At home",
    "In social situations",
  ];

  final List<String> selected = [];

  void onSelect(String value) {
    setState(() {
      if (selected.contains(value)) {
        selected.remove(value);
      } else if (selected.length < 3) {
        selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Question 10 of 16",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                const Text(
                  "Where do you most often feel your stress or want to practice mindfulness?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text("Select 3 options that apply to your day."),
                const SizedBox(height: 30),

                ...options.map(
                  (e) => OptionTile(
                    title: e,
                    isSelected: selected.contains(e),
                    onTap: () => onSelect(e),
                  ),
                ),

                const SizedBox(height: 30),
                ContinueButton(
                  onTap: selected.length == 3
                      ? () => Navigator.pushNamed(
                            context, '/stressChallenges')
                      : () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
