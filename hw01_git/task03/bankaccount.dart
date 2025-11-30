class BankAccount {
  final String _accountNumber; // номер счёта — менять нельзя
  double _balance;             // баланс — приватный

  BankAccount(this._accountNumber, [this._balance = 0]);

  String get accountNumber => _accountNumber;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Нельзя внести отрицательную или нулевую сумму.');
      return;
    }
    _balance += amount;
    print('Пополнение: $amount. Новый баланс: $_balance');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Нельзя снять отрицательную или нулевую сумму.');
      return;
    }
    if (amount > _balance) {
      print('Недостаточно средств. Доступно: $_balance');
      return;
    }
    _balance -= amount;
    print('Снятие: $amount. Новый баланс: $_balance');
  }
}

void main() {
  final account = BankAccount('123456789', 1000);

  account.deposit(500);
  account.withdraw(300);
  account.withdraw(2000);  // проверка лимита
  account.deposit(-10);    // проверка отрицательной суммы

  print('Итоговый баланс: ${account.balance}');
}
