import 'study_task.dart';

/// Holds a student's collection of [StudyTask] objects.
///
/// Uses a List (ordered collection of tasks) and builds a Map
/// (subject -> tasks) to organize them.
class StudyPlanner {
  final String owner;

  // Private list: tasks are added through addTask(), not by touching the list.
  final List<StudyTask> _tasks = [];

  StudyPlanner(this.owner);

  /// Read-only view of the tasks.
  List<StudyTask> get tasks => List.unmodifiable(_tasks);

  void addTask(StudyTask task) {
    _tasks.add(task);
  }

  /// Tasks not yet completed, earliest due date first.
  List<StudyTask> pendingTasks() {
    final pending = _tasks.where((t) => !t.isDone).toList();
    pending.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return pending;
  }

  /// Total points earned across all completed tasks.
  int get totalPoints => _tasks.fold(0, (sum, t) => sum + t.pointsEarned);

  /// Groups tasks by subject: {'Physics': [task, task], 'Math': [task]}.
  Map<String, List<StudyTask>> groupBySubject() {
    final groups = <String, List<StudyTask>>{};
    for (final task in _tasks) {
      groups.putIfAbsent(task.subject, () => []).add(task);
    }
    return groups;
  }
}
