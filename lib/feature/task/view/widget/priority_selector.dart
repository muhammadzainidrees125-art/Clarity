import 'package:flutter/material.dart';

class PrioritySelector extends StatefulWidget {
  final Function(String) onChanged;
  const PrioritySelector({super.key, required this.onChanged});

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  String selectedPriority = 'Medium';

  List<String> priorities = ['Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority Level'),
        SizedBox(height: 8),

        Wrap(
          spacing: 10,
          children: priorities.map((item) {
            return ChoiceChip(
              showCheckmark: false,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: item == 'Low'
                          ? Color(0xff22C55E)
                          : item == 'Medium'
                          ? Color(0xffF59E0B)
                          : Color(0xffEF4444),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(item),
                ],
              ),

              selected: selectedPriority == item,

              selectedColor: Color(0xffD0E1FB),
              backgroundColor: Color(0xffF3F3FE),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xffC3C6D7)),
              ),

              onSelected: (val) {
                setState(() {
                  selectedPriority = item;
                });
                widget.onChanged(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
