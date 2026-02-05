import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: WellbeingAssessmentScreen()));

class WellbeingAssessmentScreen extends StatelessWidget {
  const WellbeingAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {},
        ),
        title: const Text(
          'Question 1 of 16',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Main Title
            const Text(
              'Let\'s map your\nwellbeing landscape',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            // Description Text
            const Text(
              'This short assessment helps us understand your unique patterns, strengths, and areas for support. Your honest responses create a personalized path to clarity. All your answers are private and secure',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            // Info Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'For organization users only',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your organization only sees aggregated, anonymous insights',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Brain Icon (Using a standard Icon as a placeholder)
            const Icon(Icons.psychology, size: 80, color: Colors.black),
            const SizedBox(height: 16),
            const Text(
              "I'm Ready, Let's Begin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
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