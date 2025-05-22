// lib/services/api.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://your-backend-api.com/api';

  Future<List<dynamic>> getHabits() async {
    final response = await http.get(Uri.parse('$baseUrl/habits'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load habits');
    }
  }

  Future<void> addHabit(Map<String, dynamic> habitData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/habits'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(habitData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add habit');
    }
  }

  Future<void> deleteHabit(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/habits/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete habit');
    }
  }
}
