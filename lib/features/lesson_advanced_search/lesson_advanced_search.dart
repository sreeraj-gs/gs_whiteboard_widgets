import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gs_whiteboard_widgets/features/lesson_advanced_search/widgets/lesson_tile.dart';
import 'package:gs_whiteboard_widgets/models/shared.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';
import 'package:gs_whiteboard_widgets/widgets/dialog_container.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_checkbox.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_dropdown_form_field.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_elevated_button.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_search_bar.dart';

class LessonAdvancedSearch extends HookWidget {
  const LessonAdvancedSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final sortValue = useState<String?>(null);
    final canFilter = useState(false);
    return DialogContainer(
      width: context.isDesktop ? 50.w : 60.w,

      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GsSearchBar(width: 320, hintText: "Search Lesson"),
                TextButton.icon(
                  onPressed: () => canFilter.value = !canFilter.value,
                  icon: Icon(Icons.filter_list_outlined),
                  label: Text("Filter"),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    foregroundColor:
                        canFilter.value ? Color(0xFF0060FF) : Colors.grey,
                  ),
                ),
              ],
            ),
            if (canFilter.value) _FilterBy(),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                Text("Sort by", style: context.textTheme.titleMedium),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 50,
                  children: [
                    IntrinsicWidth(
                      child: RadioListTile.adaptive(
                        title: Text(
                          "Name",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Color(0xFF575757),
                          ),
                        ),
                        value: "name",
                        groupValue: sortValue.value,
                        onChanged: (value) => sortValue.value = value,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    IntrinsicWidth(
                      child: RadioListTile.adaptive(
                        title: Text(
                          "Date",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Color(0xFF575757),
                          ),
                        ),
                        value: "date",
                        groupValue: sortValue.value,
                        onChanged: (value) => sortValue.value = value,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _SearchResult(),
          ],
        ),
      ),
    );
  }
}

class _FilterBy extends StatelessWidget {
  const _FilterBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text("Filter by", style: context.textTheme.titleMedium),
        Row(
          spacing: 8,
          children: [
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
                labelExtractor: (subject) => subject!.name,
                initialValue: null,
                onChanged: (subject) {},
              ),
            ),
            Expanded(
              child: GsDropdownButtonFormField(
                items: [
                  Topic(name: "1", value: 1),
                  Topic(name: "2", value: 2),
                  Topic(name: "3", value: 3),
                  Topic(name: "4", value: 4),
                  Topic(name: "5", value: 5),
                ],
                label: "Topic",
                labelExtractor: (topic) => topic!.name,
                initialValue: null,
                onChanged: (topic) {},
              ),
            ),
            Expanded(
              child: GsDropdownButtonFormField(
                items: [
                  Level(name: "1", value: 1),
                  Level(name: "2", value: 2),
                  Level(name: "3", value: 3),
                  Level(name: "4", value: 4),
                  Level(name: "5", value: 5),
                ],
                label: "Level",
                labelExtractor: (level) => level!.name,
                initialValue: null,
                onChanged: (level) {},
              ),
            ),
            Flexible(
              child: GsElevatedButton(
                onPressed: () {},
                backgroundColor: Color(0xFF3EAF3F),
                child: Text("Apply"),
              ),
            ),
          ],
        ),
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

    final isAssignLesson = useState(false);
    final isAssignHomework = useState(false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  onDelete: () => toggleSelection(lesson.id, false),
                );
              },
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      "Select student",
                      style: context.textTheme.titleMedium,
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
                      onChanged: (istudent) {},
                      labelExtractor: (val) => val.name,
                      noBorder: true,
                      backgroundColor: Colors.white,
                      hintText: "Select student",
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GsCheckbox(
                          value: isAssignLesson.value,

                          label: "Assign Lesson",
                          onChanged: (value) => isAssignLesson.value = value!,
                        ),
                        GsCheckbox(
                          value: isAssignHomework.value,

                          label: "Assign homework",
                          onChanged: (value) => isAssignHomework.value = value!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 200,
            child: GsElevatedButton(
              onPressed: () {},
              child: Text("Assign Lesson"),
            ),
          ),
        ),
      ],
    );
  }
}
