import '../models/user.dart';
import '../services/user_service.dart';

class UsersViewModel {
  final UserService _userService;
  
  const UsersViewModel({UserService? userService})
      : _userService = userService ?? const UserService();
  
  Future<List<User>> getUsers() async {
    return await _userService.getUsers();
  }
  
  // Можно добавить дополнительные методы для бизнес-логики
  // Например, фильтрация, сортировка и т.д.
  Future<List<User>> getUsersByCity(String city) async {
    final users = await _userService.getUsers();
    return users.where((user) => user.address.city.toLowerCase().contains(city.toLowerCase())).toList();
  }
  
  Future<List<User>> getUsersByCompany(String companyName) async {
    final users = await _userService.getUsers();
    return users.where((user) => user.company.name.toLowerCase().contains(companyName.toLowerCase())).toList();
  }
}