import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gs_whiteboard_widgets/models/shared.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';
import 'package:gs_whiteboard_widgets/widgets/dialog_container.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_checkbox.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_dropdown_form_field.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_elevated_button.dart';

class AssignToStudents extends HookWidget {
  const AssignToStudents({super.key});

  @override
  Widget build(BuildContext context) {
    final isAssignLesson = useState(false);
    final isAssignHomework = useState(false);
    return DialogContainer(
      width: 25.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 14,
        children: [
          Text(
            "Assign to students",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF575757),
            ),
          ),

          GsDropdownButtonFormField(
            items: [
              Grade(name: "1", value: 1),
              Grade(name: "2", value: 2),
              Grade(name: "3", value: 3),
              Grade(name: "4", value: 4),
              Grade(name: "5", value: 5),
            ],
            label: "Grade",
            labelExtractor: (grade) => grade!.name,
            initialValue: null,
            onChanged: (grade) {},
          ),

          GsDropdownButtonFormField(
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

          Column(
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
          GsElevatedButton(onPressed: () {}, child: Text("Assign Lesson")),
        ],
      ),
    );
  }
}
