import 'package:flutter/material.dart';

class TagsInputField extends StatefulWidget {
  final String title;
  final Function(List<String>) onChanged;

  const TagsInputField({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  State<TagsInputField> createState() => _TagsInputFieldState();
}

class _TagsInputFieldState extends State<TagsInputField> {
  final TextEditingController _controller = TextEditingController();
  List<String> tags = [];

  void addTag(String value) {
    if (value.trim().isEmpty) return;

    setState(() {
      tags.add(value.trim());
      _controller.clear();
    });

    widget.onChanged(tags); // return list to parent
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });

    widget.onChanged(tags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),

        const SizedBox(height: 8),

        TextField(
          controller: _controller,
          onSubmitted: addTag,
          decoration: const InputDecoration(
            hintText: "Type tag and press enter",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          children: tags.map((tag) {
            return Chip(
              label: Text(tag),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () => removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
