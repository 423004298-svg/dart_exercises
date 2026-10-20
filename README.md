# ClassQuest OOP (Dart console program)

PC16 Mobile Development with Lab - Week 9: Object-Oriented Programming in Dart (Part 1).

A small console program that models the study tasks from the ClassQuest app (a gamified study habit and deadline tracker).

## What it demonstrates (rubric checklist)

| Requirement | Where |
| --- | --- |
| Class with fields and methods | `StudyTask` in `lib/study_task.dart` (fields: `title`, `subject`, `dueDate`; methods: `daysLeft`, `complete`, `reschedule`, `statusLabel`) |
| Constructor that sets initial values | `StudyTask(this.title, this.subject, this.dueDate)` with `_isDone = false`, `_pointsEarned = 0` |
| Encapsulation (private field) | `_isDone` and `_pointsEarned`, read through getters `isDone` / `pointsEarned`, changed only by `complete()` |
| List or Map | `StudyPlanner` keeps a `List<StudyTask>` and `groupBySubject()` returns a `Map<String, List<StudyTask>>` |
| Objects created and tested in `main()` | `bin/main.dart` creates four tasks, calls their methods, prints results |

## Run it

Requires the Dart SDK (or Flutter, which includes it).

```
dart run
```

Or run `bin/main.dart` from your IDE.

## Project structure

```
bin/main.dart            # entry point: creates objects and prints results
lib/study_task.dart      # StudyTask class (private fields, constructor, methods)
lib/study_planner.dart   # StudyPlanner class (List + Map)
pubspec.yaml
```

## Reflective exit ticket (write this in your own words)

Private field I chose: `_isDone` (and `_pointsEarned`).

Why: if any code could set `_isDone = true` directly, a task could be "finished" without going through `complete()`, which is the only place that checks for double completion and awards the right points. Keeping it private means the rules live in one place.

## Next week (Week 10)

`StudyTask` is the base class to extend with inheritance and polymorphism (for example `Quiz`, `Project`, `Exam` subclasses overriding how points are earned).
