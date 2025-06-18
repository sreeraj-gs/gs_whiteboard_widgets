import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/features/assign_to_students/assign_to_students.dart';
import 'package:gs_whiteboard_widgets/features/homework_advanced_search/homework_adavanced_search.dart';
import 'package:gs_whiteboard_widgets/features/lesson_advanced_search/lesson_advanced_search.dart';
import 'package:gs_whiteboard_widgets/features/save_this_lesson/save_this_lesson.dart';
import 'package:gs_whiteboard_widgets/utils/dialog_utils.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Growing Stars white board")),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed:
                  () => showStyledAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    child: SaveThisLesson(),
                  ),
              child: Text("Show save lesson"),
            ),
            ElevatedButton(
              onPressed:
                  () => showStyledAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    child: LessonAdvancedSearch(),
                  ),
              child: Text("Show adavanced"),
            ),
            ElevatedButton(
              onPressed:
                  () => showStyledAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    child: AssignToStudents(),
                  ),
              child: Text("Assign to students"),
            ),
            Divider(),
            ElevatedButton(
              onPressed:
                  () => showStyledAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    child: HomeworkAdavancedSearch(),
                  ),
              child: Text("Homework advanced search"),
            ),
          ],
        ),
      ),
    );
  }
}
