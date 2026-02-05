import 'package:flutter/material.dart';

class OverwhelmedActionsScreen extends StatefulWidget {
  const OverwhelmedActionsScreen({Key? key}) : super(key: key);

  @override
  State<OverwhelmedActionsScreen> createState() =>
      _OverwhelmedActionsScreenState();
}

class _OverwhelmedActionsScreenState extends State<OverwhelmedActionsScreen> {
  final List<_ActionItem> actions = [
    _ActionItem("Take a walk", Icons.directions_walk),
    _ActionItem("Talk to someone", Icons.chat_bubble_outline),
    _ActionItem("Scroll on phone", Icons.phone_android),
    _ActionItem("Isolate myself", Icons.person_outline),
    _ActionItem("Practice deep breathing", Icons.self_improvement),
    _ActionItem("Skip meals", Icons.no_food),
    _ActionItem("Journal", Icons.menu_book),
  ];

  bool get allAnswered =>
      actions.every((action) => action.helpsMe != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "What do you typically do\nwhen feeling Overwhelmed\nor down?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: actions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = actions[index];
                  return _ActionTile(
                    item: item,
                    onChanged: () => setState(() {}),
                  );
                },
              ),
            ),

            /// Continue Button (UPDATED)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: allAnswered
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/support-level',
                        );
                      }
                    : null,
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

/// ---------------- Models ----------------

class _ActionItem {
  final String label;
  final IconData icon;
  bool? helpsMe; // true = helps, false = doesn't help, null = unselected

  _ActionItem(this.label, this.icon);
}

/// ---------------- Widgets ----------------

class _ActionTile extends StatelessWidget {
  final _ActionItem item;
  final VoidCallback onChanged;

  const _ActionTile({
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(item.icon, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _SegmentButton(
            text: "Helps me",
            selected: item.helpsMe == true,
            onTap: () {
              item.helpsMe = true;
              onChanged();
            },
          ),
          const SizedBox(width: 6),
          _SegmentButton(
            text: "Doesn't help",
            selected: item.helpsMe == false,
            onTap: () {
              item.helpsMe = false;
              onChanged();
            },
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
