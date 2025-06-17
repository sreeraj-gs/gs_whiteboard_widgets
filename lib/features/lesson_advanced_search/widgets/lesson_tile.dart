import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';

class LessonTile extends StatelessWidget {
  final String lessonName;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onDelete;

  const LessonTile({
    super.key,
    required this.lessonName,
    required this.isSelected,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isSelected,
        onChanged: onChanged,
        visualDensity: VisualDensity.compact, // Keep checkbox compact
      ),
      title: Text(
        lessonName,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.normal,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline, color: Colors.red[400]),
        onPressed: onDelete,
        tooltip: "Delete Lesson",
        visualDensity: VisualDensity.compact,
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
