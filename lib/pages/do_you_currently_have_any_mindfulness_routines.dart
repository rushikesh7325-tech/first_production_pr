import 'package:flutter/material.dart';

class DoYouCurrentlyHaveAnyMindfulnessRoutines extends StatefulWidget {
  const DoYouCurrentlyHaveAnyMindfulnessRoutines({Key? key}) : super(key: key);

  @override
  State<DoYouCurrentlyHaveAnyMindfulnessRoutines> createState() =>
      _DoYouCurrentlyHaveAnyMindfulnessRoutinesState();
}

class _DoYouCurrentlyHaveAnyMindfulnessRoutinesState
    extends State<DoYouCurrentlyHaveAnyMindfulnessRoutines> {
  String? selectedOption;
  final TextEditingController detailsController = TextEditingController();

  bool get showDetailsInput =>
      selectedOption == 'Yes, regularly' ||
      selectedOption == 'Yes, sometimes';

  @override
  void dispose() {
    detailsController.dispose();
    super.dispose();
  }

  Widget _optionTile(String text) {
    final bool isSelected = selectedOption == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
          if (text == 'No') {
            detailsController.clear();
          }
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade400),
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Question 8 of 16',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            const Text(
              "Do you currently have any routines for mindfulness, relaxation, or dedicated 'you-time'?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 32),

            _optionTile('Yes, regularly'),
            _optionTile('Yes, sometimes'),
            _optionTile('No'),

            if (showDetailsInput) ...[
              const SizedBox(height: 8),
              TextField(
                controller: detailsController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText:
                      "What kind? (e.g., meditation, reading, hobbies)",
                  helperText: "It's okay if nothing comes to mind!",
                  contentPadding: const EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedOption == null ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
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
