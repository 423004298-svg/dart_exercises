# ClassQuest OOP (Dart console program)

> Week 9 base program + Week 11 async addition (see the Week 11 section below).

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

## Week 11 - Async behavior

Added to `StudyTask` (`lib/study_task.dart`):

- `Future<String> saveToServer()` - simulates saving the task. It waits 2 seconds with `Future.delayed`, then marks the private field `_isSaved` as true and returns a confirmation message.
- `bool get isSaved` - read-only getter for the new private field.

`main()` in `bin/main.dart` is now `Future<void> main() async` and:

1. Prints "Saving ..." immediately, then `await`s `saveToServer()` and prints the result only after it is ready.
2. Starts a second save without awaiting it, prints other messages while it is still running (proof it is non-blocking), then awaits it.

Expected print order: the "Saving..." line appears first, about 2 seconds pass, then the "Saved ..." line. Run `dart run` at least twice and confirm the order and delay are the same each time.

### Be ready to explain (Week 12 oral defense)

- Why `Future<String>`: the result is not available immediately, so the method returns a promise of a String.
- Why `async` on the method and `await` in main: `await` pauses only this function until the Future completes, while the program is still free to run other code (shown by the second save).
- Why `Future.delayed`: it stands in for real network or disk time.
- Why `_isSaved` is private: only the save method should be able to mark a task as saved.
