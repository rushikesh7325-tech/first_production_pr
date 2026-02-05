import 'package:flutter/material.dart';

class ReduceAnxietyFeelingsScreen extends StatefulWidget {
  const ReduceAnxietyFeelingsScreen({Key? key}) : super(key: key);

  @override
  State<ReduceAnxietyFeelingsScreen> createState() =>
      _ReduceAnxietyFeelingsScreenState();
}

class _ReduceAnxietyFeelingsScreenState
    extends State<ReduceAnxietyFeelingsScreen> {
  final List<String> options = [
    "Racing thoughts",
    "Muscle tension",
    "Negative self-talk",
    "Fatigue",
    "Restlessness",
    "Irritability",
    "Comparing to others",
    "Fear of failure",
    "Forgetfulness",
    "Easily distracted",
    "Mental fog",
    "Procrastination",
    "Self-doubt",
    "Feeling overwhelmed",
  ];

  final Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Question 3 of 16",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "When you think about your selected goal of Reduce Anxiety, "
              "what does that often feel like?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            /// Options
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: options.map((option) {
                    final isSelected = selectedOptions.contains(option);
                    return ChoiceChip(
                      label: Text(option),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selected
                              ? selectedOptions.add(option)
                              : selectedOptions.remove(option);
                        });
                      },
                      selectedColor: Colors.black,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      shape: const StadiumBorder(),
                    );
                  }).toList(),
                ),
              ),
            ),

            /// Continue Button (UPDATED)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedOptions.isEmpty
                    ? null
                    : () {
                        Navigator.pushNamed(
                          context,
                          '/overwhelmed-actions',
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey.shade400,
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
