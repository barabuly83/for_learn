void main() {
  // Тестирование функции filterEvenNumbers
  print('Тест функции filterEvenNumbers:');
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> evenNumbers = filterEvenNumbers(numbers);
  print('Исходный список: $numbers');
  print('Четные числа: $evenNumbers');

  // Тестирование класса Student и функции сортировки
  print('\n Тест класса Student и сортировки:');
  
  List<Student> students = [
    Student('Иван', 20, 4.5),
    Student('Мария', 21, 4.8),
    Student('Алексей', 19, 4.2),
    Student('Елена', 22, 4.9),
    Student('Дмитрий', 20, 4.0),
  ];

  print('Студенты до сортировки:');
  for (var student in students) {
    print(student);
  }

  List<Student> sortedStudents = sortStudentsByGPA(students);
  
  print('\n Студенты после сортировки по среднему баллу (по убыванию):');
  for (var student in sortedStudents) {
    print(student);
  }
}

// Функция для фильтрации четных чисел
List<int> filterEvenNumbers(List<int> numbers) {
  List<int> result = [];
  for (int number in numbers) {
    if (number % 2 == 0) {
      result.add(number);
    }
  }
  return result;
}

// Класс Student
class Student {
  String name;
  int age;
  double gpa;

  Student(this.name, this.age, this.gpa);

  @override
  String toString() {
    return 'Студент: $name, возраст: $age, средний балл: $gpa';
  }
}

// Функция для сортировки студентов по среднему баллу в порядке убывания
List<Student> sortStudentsByGPA(List<Student> students) {
  List<Student> sortedList = List.from(students);
  sortedList.sort((a, b) => b.gpa.compareTo(a.gpa));
  return sortedList;
}