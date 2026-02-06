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
    "While trying to sleep",
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
    final bool canContinue = selected.length == 3;
    final int remaining = 3 - selected.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Step 10 of 16",
          style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Where do you most often feel your stress?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              
              // Helper text that updates based on selection count
              Text(
                canContinue 
                  ? "Got it! Tap continue to proceed." 
                  : "Select $remaining more ${remaining == 1 ? 'location' : 'locations'}.",
                style: TextStyle(
                  color: canContinue ? Colors.green.shade700 : Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: canContinue ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 32),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: options.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = options[index];
                    return OptionTile(
                      title: item,
                      isSelected: selected.contains(item),
                      onTap: () => onSelect(item),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),
              ContinueButton(
                onTap: canContinue
                    ? () => Navigator.pushNamed(context, '/stresschallenge')
                    : () {}, // Disabling the button if count != 3
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}