import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  const UserService();

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map((json) => User.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
