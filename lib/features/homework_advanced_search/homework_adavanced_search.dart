import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gs_whiteboard_widgets/features/lesson_advanced_search/widgets/lesson_tile.dart';
import 'package:gs_whiteboard_widgets/models/shared.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';
import 'package:gs_whiteboard_widgets/widgets/dialog_container.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_date_picker_form_field.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_dropdown_form_field.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_elevated_button.dart';

class HomeworkAdavancedSearch extends StatelessWidget {
  const HomeworkAdavancedSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      width: 60.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14,
        children: [
          Text(
            "Advanced Search",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF575757),
            ),
          ),
          _SearchOptions(),
        ],
      ),
    );
  }
}

class _SearchOptions extends StatelessWidget {
  const _SearchOptions();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: GsDropdownButtonFormField(
                items: [
                  Grade(name: "1", value: 1),
                  Grade(name: "2", value: 2),
                  Grade(name: "3", value: 3),
                  Grade(name: "4", value: 4),
                  Grade(name: "5", value: 5),
                ],
                label: "Student",
                labelExtractor: (student) => student!.name,
                initialValue: null,
                onChanged: (student) {},
              ),
            ),
            Expanded(
              child: GsDropdownButtonFormField(
                items: [
                  Grade(name: "1", value: 1),
                  Grade(name: "2", value: 2),
                  Grade(name: "3", value: 3),
                  Grade(name: "4", value: 4),
                  Grade(name: "5", value: 5),
                ],
                label: "Tutor",
                labelExtractor: (tutor) => tutor!.name,
                initialValue: null,
                onChanged: (tutor) {},
              ),
            ),
            Expanded(
              child: GsDropdownButtonFormField(
                items: [
                  Subject(name: "1", value: 1),
                  Subject(name: "2", value: 2),
                  Subject(name: "3", value: 3),
                  Subject(name: "4", value: 4),
                  Subject(name: "5", value: 5),
                ],
                label: "Subject",
                labelExtractor: (sub) => sub!.name,
                initialValue: null,
                onChanged: (sub) {},
              ),
            ),
            Expanded(
              child: GsDatePickerFormField(
                label: "Date",
                onDateSelected: (DateTime? value) {},
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 160),
            child: GsElevatedButton(onPressed: () {}, child: Text("Search")),
          ),
        ),
        _SearchResult(),
      ],
    );
  }
}

class _SearchResult extends HookWidget {
  const _SearchResult();
  static final List<Lesson> _lessons = [
    Lesson(id: 1, name: "Algebra"),
    Lesson(id: 2, name: "Geometry"),
    Lesson(id: 3, name: "Trigonometry"),
    Lesson(id: 4, name: "Calculus"),
    Lesson(id: 5, name: "Statistics"),
  ];
  @override
  Widget build(BuildContext context) {
    final selectedIds = useState<Set<int>>({});
    final scrollController = useScrollController();
    void toggleSelection(int lessonId, bool selected) {
      selectedIds.value =
          selected
              ? {...selectedIds.value, lessonId}
              : selectedIds.value.where((id) => id != lessonId).toSet();
    }

    return Column(
      spacing: 14,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Results', style: context.textTheme.titleMedium),
              Text(
                "Selected: ${selectedIds.value.length}",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF0060FF),
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: ListView.separated(
              itemCount: _lessons.length,
              controller: scrollController,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final lesson = _lessons[index];
                final isSelected = selectedIds.value.contains(lesson.id);

                return LessonTile(
                  lessonName: lesson.name,
                  isSelected: isSelected,
                  onChanged: (checked) {
                    if (checked == null) return;
                    toggleSelection(lesson.id, checked);
                  },
                );
              },
            ),
          ),
        ),
        Row(
          spacing: 14,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 160,
              child: GsElevatedButton(
                onPressed: selectedIds.value.isNotEmpty ? () {} : null,
                backgroundColor: context.colorScheme.error,
                child: Text("Delete Selected"),
              ),
            ),
            SizedBox(
              width: 240,
              child: GsElevatedButton(
                onPressed: selectedIds.value.length == 1 ? () {} : null,
                child: Text("View selected Homework"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
