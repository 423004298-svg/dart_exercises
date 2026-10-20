/// A single deadline a student needs to finish (assignment, quiz, project...).
///
/// Week 9 concepts used here:
///  - Class with fields and methods
///  - Constructor that sets the initial values
///  - Encapsulation: `_isDone` and `_pointsEarned` are private (underscore),
///    so code outside this file can only read them through getters and can
///    only change them through `complete()`.
class StudyTask {
  // Public fields (part of the task's identity; safe to read directly).
  final String title;
  final String subject;
  DateTime dueDate;

  // Private fields: outside code must not set these directly, otherwise a
  // task could be marked done (or given points) without following the rules.
  bool _isDone;
  int _pointsEarned;

  /// Constructor: sets the initial values when a new task is created.
  StudyTask(this.title, this.subject, this.dueDate)
      : _isDone = false,
        _pointsEarned = 0;

  // Read-only access to the private fields.
  bool get isDone => _isDone;
  int get pointsEarned => _pointsEarned;

  /// Whole days from [today] until the due date (negative = overdue).
  int daysLeft(DateTime today) {
    final t = DateTime.utc(today.year, today.month, today.day);
    final d = DateTime.utc(dueDate.year, dueDate.month, dueDate.day);
    return d.difference(t).inDays;
  }

  /// Marks the task done and returns the points earned:
  /// 10 if finished on or before the due date, 3 if late, 0 if it was
  /// already completed (no double points).
  int complete(DateTime today) {
    if (_isDone) return 0;
    _isDone = true;
    _pointsEarned = daysLeft(today) >= 0 ? 10 : 3;
    return _pointsEarned;
  }

  /// Controlled way to change the due date. Finished tasks can't be moved.
  /// Returns true if the change was applied.
  bool reschedule(DateTime newDueDate) {
    if (_isDone) return false;
    dueDate = newDueDate;
    return true;
  }

  /// Short human-readable status, e.g. "due in 2 days" or "done (+10 pts)".
  String statusLabel(DateTime today) {
    if (_isDone) return 'done (+$_pointsEarned pts)';
    final days = daysLeft(today);
    if (days < 0) return 'overdue by ${-days} day(s)';
    if (days == 0) return 'due today';
    return 'due in $days day(s)';
  }

  @override
  String toString() => '${_isDone ? '[x]' : '[ ]'} $title ($subject)';
}
