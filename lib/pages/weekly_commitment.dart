import 'package:flutter/material.dart';

class WeeklyCommitment extends StatefulWidget {
  const WeeklyCommitment({Key? key}) : super(key: key);

  @override
  State<WeeklyCommitment> createState() => _WeeklyCommitmentState();
}

class _WeeklyCommitmentState extends State<WeeklyCommitment> {
  String? selectedOption;

  final List<String> options = [
    'Just 5-10 minutes, a few times',
    '15-20 minutes, 2-3 times',
    "I'll play it by ear",

  ];

  Widget _optionTile(String text) {
    final bool isSelected = selectedOption == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Weekly Commitment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            const Text(
              "To start, what's a realistic amount of time you can dedicate to your wellbeing each week?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 32),

            ...options.map(_optionTile),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedOption == null
                    ? null
                    : () {
                        // Save answer example
                        // onboardingController.updateAnswer(
                        //   'weekly_commitment',
                        //   selectedOption,
                        // );

                        // Navigate to next screen
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
