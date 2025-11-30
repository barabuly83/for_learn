import 'dart:math';

/// Базовый класс фигуры
abstract class Shape {
  double area();
  double perimeter();
}

/// Круг
class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() => pi * radius * radius;

  @override
  double perimeter() => 2 * pi * radius;
}

/// Прямоугольник
class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

/// Треугольник по трём сторонам
class Triangle extends Shape {
  final double a;
  final double b;
  final double c;

  Triangle(this.a, this.b, this.c);

  @override
  double perimeter() => a + b + c;

  @override
  double area() {
    final p = perimeter() / 2; // полупериметр
    return sqrt(p * (p - a) * (p - b) * (p - c)); // формула Герона
  }
}

void main() {
  // список фигур типа Shape — полиморфизм
  final List<Shape> shapes = [
    Circle(3),
    Rectangle(4, 5),
    Triangle(3, 4, 5),
  ];

  for (final shape in shapes) {
    print(
      '${shape.runtimeType}: area = ${shape.area().toStringAsFixed(2)}, '
      'perimeter = ${shape.perimeter().toStringAsFixed(2)}',
    );
  }
}
