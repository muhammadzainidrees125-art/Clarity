


import 'custom_choicechip.dart';
import 'package:flutter/material.dart';

class TaskChoiceChipSection extends StatelessWidget {
  const TaskChoiceChipSection({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  final List<String> items = const ['All', 'Pending', 'In Progress', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomChoiceChip(
              title: items[index],
              isSelected: selectedIndex == index,
              onTap: () => onSelected(index),
            ),
          );
        }),
      ),
    );
  }
}
