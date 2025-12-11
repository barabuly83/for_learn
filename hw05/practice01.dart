void main() {
  print('Практика 1: Наследование и миксины\n');
  
  // Создаем объекты Dog и Cat
  Dog myDog = Dog('Бобик');
  Cat myCat = Cat('Мурзик');
  
  // Вызываем методы makeSound()
  print('Звуки животных:');
  myDog.makeSound();  // Выведет: Woof!
  myCat.makeSound();  // Выведет: Meow!
  
  // Вызываем метод jump() для Dog
  print('\n Прыжки:');
  myDog.jump();       // Выведет: Jumping!
  // myCat.jump();    // Ошибка! У Cat нет метода jump()
  
  // Дополнительно: демонстрация работы с базовым классом
  print('\n Использование базового класса:');
  Animal genericAnimal = Animal('Неизвестное животное');
  genericAnimal.makeSound();  // Выведет: Some generic sound
}

// Базовый класс Animal
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Some generic sound');
  }
}

// Миксин Jumpable
mixin Jumpable {
  void jump() {
    print('Jumping!');
  }
}

// Класс Dog наследует Animal и использует миксин Jumpable
class Dog extends Animal with Jumpable {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('Woof!');
  }
}

// Класс Cat наследует Animal
class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() {
    print('Meow!');
  }
}