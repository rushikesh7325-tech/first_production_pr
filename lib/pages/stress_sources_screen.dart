import 'package:flutter/material.dart';
import '../widgets/option_tile.dart';
import '../widgets/continue_button.dart';

class StressSourcesScreen extends StatefulWidget {
  const StressSourcesScreen({super.key});

  @override
  State<StressSourcesScreen> createState() => _StressSourcesScreenState();
}

class _StressSourcesScreenState extends State<StressSourcesScreen> {
  final List<String> options = [
    "Workload",
    "Academics",
    "Health",
    "Financial Concerns",
    "Feeling Disconnected",
    "Relationships (Personal/Professional)",
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
                const Text("Question 9 of 16",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                const Text(
                  "What are your biggest sources of stress or pressure right now?",
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
                            context, '/stressLocation')
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
