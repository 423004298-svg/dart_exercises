// Week 7 Dart Exercise: Grade Computation
// Scenario: compute a student's final grade from quizzes and an exam,
// then check whether the student passed.

void main() {
  // ---------- Variables (int, double, String, bool) ----------
  String studentName = 'Kylle Paulino';
  String subjectName = 'Mobile Development';
  int numberOfQuizzes = 4;
  double quiz1 = 88.5;
  double quiz2 = 92.0;
  double quiz3 = 79.5;
  double quiz4 = 90.0;
  double quiz5 = 80.0;
  double examScore = 84.0;
  double passingMark = 75.0;

  // ---------- Arithmetic operators ----------
  double totalQuizScore = quiz1 + quiz2 + quiz3 + quiz4 + quiz5; // +
  double quizAverage = totalQuizScore / numberOfQuizzes; // /
  double finalGrade = (quizAverage * 0.40) + (examScore * 0.60); // * and +
  int wholePoints = finalGrade ~/ 1; // ~/ keeps the whole number only
  double decimalPart = finalGrade % 1; // % keeps the leftover decimal

  // ---------- Comparison operators ----------
  bool hasPassed = finalGrade >= passingMark; // >=
  bool isPerfect = finalGrade == 100.0; // ==
  bool examBeatsQuizzes = examScore > quizAverage; // >
  bool isNotFailing = finalGrade != 0; // !=

  // ---------- Output ----------
  print('Student: $studentName');
  print('Subject: $subjectName');
  print('Quizzes taken: $numberOfQuizzes');
  print('Total quiz score: ${totalQuizScore.toStringAsFixed(2)}');
  print('Quiz average: ${quizAverage.toStringAsFixed(2)}');
  print('Exam score: ${examScore.toStringAsFixed(2)}');
  print(
    'Final grade (40% quizzes + 60% exam): ${finalGrade.toStringAsFixed(2)}',
  );
  print('Whole points (~/): $wholePoints');
  print('Decimal part (%): ${decimalPart.toStringAsFixed(2)}');
  print('Passing mark: ${passingMark.toStringAsFixed(2)}');
  print('Passed? $hasPassed');
  print('Perfect score? $isPerfect');
  print('Exam higher than quiz average? $examBeatsQuizzes');
  print('Grade is not zero? $isNotFailing');
}
