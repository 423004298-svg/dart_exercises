/// Week 7 & 8 Dart Exercise: Grade Computation
/// Refactored to ensure strict adherence to control structure requirements,
/// robust error handling, and modular function design.

/// Custom Exception for validation logic
class InvalidScoreException implements Exception {
  final String message;
  InvalidScoreException(this.message);
  @override
  String toString() => 'InvalidScoreException: $message';
}

/// Represents a Student and their grade assessment logic
class Student {
  final String name;
  final List<double> quizScores;
  final double examScore;

  Student(this.name, this.quizScores, this.examScore);

  /// Function takes no parameter (accesses fields), returns average
  double calculateAverageQuiz() {
    if (quizScores.isEmpty) return 0.0;
    double sum = 0;
    // Loop correctly repeats task a fixed number of times
    for (int i = 0; i < quizScores.length; i++) {
      sum += quizScores[i];
    }
    return sum / quizScores.length;
  }

  /// Computes final grade using specific weighted percentages
  double finalGrade() {
    return (calculateAverageQuiz() * 0.40) + (examScore * 0.60);
  }

  /// If/else correctly checks a value and returns a different string for each case
  String getLetterGrade(double grade) {
    if (grade >= 90) {
      return 'A';
    } else if (grade >= 80) {
      return 'B';
    } else if (grade >= 70) {
      return 'C';
    } else if (grade >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  void display() {
    double grade = finalGrade();
    print('\n--- Student Report ---');
    print('Name: $name');
    print('Final Average: ${grade.toStringAsFixed(2)}');
    print('Letter Grade: ${getLetterGrade(grade)}');
  }
}

/// Function takes a parameter, performs validation, and returns the valid score
double validateScore(double value) {
  if (value < 0 || value > 100) {
    throw InvalidScoreException('Value $value is out of bounds [0-100].');
  }
  return value;
}

void main() {
  print('--- Starting Grade Computation System ---');

  // Input data simulation
  final String name = 'Kylle Paulino';
  final List<double> quizInputs = [88.5, 92.0, 79.5, 90.0, 80.0];
  final double examInput = 84.0;

  // try/catch block ensures error handling without crashing
  try {
    List<double> validatedQuizzes = [];

    // Loop through inputs and validate each one
    for (var score in quizInputs) {
      validatedQuizzes.add(validateScore(score));
    }

    // Validate exam score separately
    double validExam = validateScore(examInput);

    // Create object and display
    Student student = Student(name, validatedQuizzes, validExam);
    student.display();

  } on InvalidScoreException catch (e) {
    // handling of known validation errors
    print('Validation Error: ${e.message}');
  } catch (e) {
    // handling of unexpected errors
    print('An unexpected error occurred: $e');
  } finally {
    print('\nProcess execution finished.');
  }

  // Demonstration of error handling
  print('\n--- Demonstration of Error Handling ---');
  try {
    print('Attempting to validate invalid score: 105.5');
    validateScore(105.5);
  } on InvalidScoreException catch (e) {
    print('Caught expected error example: ${e.message}');
  }
}
