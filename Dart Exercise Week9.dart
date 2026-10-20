import 'package:classquest_oop/study_planner.dart';
import 'package:classquest_oop/study_task.dart';

void main() {
  final today = DateTime.now();
  final planner = StudyPlanner('ClassQuest Student');

  // Create several objects from the StudyTask class (constructor in action).
  final lab = StudyTask('Physics Lab Report', 'Physics',
      today.add(const Duration(days: 2)));
  final quiz =
      StudyTask('Calculus Quiz 3', 'Math', today.add(const Duration(days: 5)));
  final worksheet = StudyTask('Chemistry Worksheet', 'Chemistry',
      today.subtract(const Duration(days: 1))); // already overdue
  final proposal = StudyTask('Physics Project Proposal', 'Physics',
      today.add(const Duration(days: 7)));

  // Store them in the planner's List.
  for (final task in [lab, quiz, worksheet, proposal]) {
    planner.addTask(task);
  }

  print('=== All tasks ===');
  for (final task in planner.tasks) {
    print('$task - ${task.statusLabel(today)}');
  }

  print('\n=== Completing tasks ===');
  print('${lab.title}: +${lab.complete(today)} pts (on time)');
  print('${worksheet.title}: +${worksheet.complete(today)} pts (late)');
  print('${lab.title} again: +${lab.complete(today)} pts (no double points)');

  print('\n=== Rescheduling ===');
  print('Move quiz: ${quiz.reschedule(today.add(const Duration(days: 8)))}');
  print('Move finished lab: ${lab.reschedule(today.add(const Duration(days: 8)))}');

  print('\n=== Pending (earliest due first) ===');
  for (final task in planner.pendingTasks()) {
    print('$task - ${task.statusLabel(today)}');
  }

  print('\n=== Grouped by subject (Map) ===');
  planner.groupBySubject().forEach((subject, tasks) {
    print('$subject: ${tasks.map((t) => t.title).join(', ')}');
  });

  print('\nTotal points: ${planner.totalPoints}');

  // Encapsulation check: these lines would NOT compile if uncommented,
  // because _isDone / _pointsEarned are private to study_task.dart.
  // lab._isDone = false;
  // lab._pointsEarned = 999;
  // lab.isDone = false;   // getter only, no setter
}
