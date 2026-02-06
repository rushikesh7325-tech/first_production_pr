import 'package:flutter/material.dart';
import '../navigation/routes.dart';

class ReduceAnxietyFeelingsScreen extends StatefulWidget {
  const ReduceAnxietyFeelingsScreen({super.key});

  @override
  State<ReduceAnxietyFeelingsScreen> createState() =>
      _ReduceAnxietyFeelingsScreenState();
}

class _ReduceAnxietyFeelingsScreenState extends State<ReduceAnxietyFeelingsScreen> {
  final List<String> options = [
    "Racing thoughts", "Muscle tension", "Negative self-talk",
    "Fatigue", "Restlessness", "Irritability",
    "Comparing to others", "Fear of failure", "Forgetfulness",
    "Easily distracted", "Mental fog", "Procrastination",
    "Self-doubt", "Feeling overwhelmed",
  ];

  final Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Question 3 of 16",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "When you think about your goal to Reduce Anxiety, what does that often feel like?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Select all that apply to you.",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
            ),
            const SizedBox(height: 32),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 12,
                  children: options.map((option) {
                    final isSelected = selectedOptions.contains(option);
                    return FilterChip(
                      label: Text(option),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selected ? selectedOptions.add(option) : selectedOptions.remove(option);
                        });
                      },
                      showCheckmark: false, // Cleaner look for wellness apps
                      selectedColor: Colors.black,
                      backgroundColor: const Color(0xFFF5F5F7),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                          color: isSelected ? Colors.black : Colors.transparent,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 16),
            
            /// Action Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: selectedOptions.isEmpty
                    ? null
                    : () => Navigator.pushNamed(context, Routes.m4copping), // Adjust route as needed
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey.shade200,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedOptions.isEmpty ? Colors.grey.shade500 : Colors.white,
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