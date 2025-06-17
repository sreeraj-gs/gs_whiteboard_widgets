import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/models/shared.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';
import 'package:gs_whiteboard_widgets/widgets/dialog_container.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_dropdown_form_field.dart';
import 'package:gs_whiteboard_widgets/widgets/gs_elevated_button.dart';

class SaveThisLesson extends StatelessWidget {
  SaveThisLesson({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      width: 25.w,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 14,
          children: [
            Text(
              "Save This Lesson",
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
            GsDropdownButtonFormField(
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
            GsDropdownButtonFormField(
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
            GsDropdownButtonFormField(
              items: [
                Name(name: "1", value: 1),
                Name(name: "2", value: 2),
                Name(name: "3", value: 3),
                Name(name: "4", value: 4),
                Name(name: "5", value: 5),
              ],
              label: "Name",
              labelExtractor: (name) => name!.name,
              initialValue: null,
              onChanged: (name) {},
            ),
            GsElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Text("Save Lesson"),
            ),
          ],
        ),
      ),
    );
  }
}
