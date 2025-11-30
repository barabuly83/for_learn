abstract class Vehicle {
  double speed;  // текущая скорость
  String color;

  Vehicle({
    required this.speed,
    required this.color,
  });

  void drive();
  void stop() {
    speed = 0;
    print('$runtimeType остановился.');
  }

  bool checkSpeedLimit(double maxSpeed) {
    if (speed > maxSpeed) {
      print(
        '$runtimeType: превышение допустимой скорости! '
        'Текущая: $speed, лимит: $maxSpeed',
      );
      return false;
    }
    return true;
  }
}

class Car extends Vehicle {
  bool _engineStatus = false; // приватный статус двигателя

  Car({
    required double speed,
    required String color,
  }) : super(speed: speed, color: color);

  bool get engineStatus => _engineStatus;

  void startEngine() {
    _engineStatus = true;
    print('Двигатель автомобиля запущен.');
  }

  void stopEngine() {
    _engineStatus = false;
    print('Двигатель автомобиля выключен.');
  }

  @override
  void drive() {
    if (!_engineStatus) {
      print('Нельзя начать движение: двигатель выключен.');
      return;
    }
    print('Автомобиль едет со скоростью $speed км/ч, цвет: $color.');
  }
}

class Bicycle extends Vehicle {
  bool engineStatus; // по заданию — публичный

  Bicycle({
    required double speed,
    required String color,
    this.engineStatus = false,
  }) : super(speed: speed, color: color);

  @override
  void drive() {
    print('Велосипед движется со скоростью $speed км/ч, цвет: $color.');
  }
}

void main() {
  final car = Car(speed: 90, color: 'red');
  car.startEngine();
  car.drive();
  car.checkSpeedLimit(80); // проверка превышения
  car.stop();
  car.stopEngine();

  print('---');

  final bicycle = Bicycle(speed: 25, color: 'blue');
  bicycle.engineStatus = true; // доступен публично
  bicycle.drive();
  bicycle.checkSpeedLimit(30);
  bicycle.speed = 40;
  bicycle.checkSpeedLimit(30); // теперь превышение
  bicycle.stop();
}
