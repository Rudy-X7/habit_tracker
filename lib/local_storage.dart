import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Save user profile (as JSON string)
Future<void> saveUserProfile(Map<String, dynamic> profile) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userProfile', jsonEncode(profile));
}

/// Get user profile (as Map)
Future<Map<String, dynamic>?> getUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final profileString = prefs.getString('userProfile');
  if (profileString != null) {
    try {
      final decoded = jsonDecode(profileString);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (e) {
      print('Error decoding user profile: $e');
    }
  }
  return null;
}

/// Save a user action with optional timestamp and history limit
Future<void> saveUserAction(String action) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> actions = prefs.getStringList('userActions') ?? [];

  // Optional: Add timestamp
  final timestampedAction = '${DateTime.now().toIso8601String()} - $action';
  actions.add(timestampedAction);

  // Optional: Limit to last 50 actions
  const maxActions = 50;
  if (actions.length > maxActions) {
    actions = actions.sublist(actions.length - maxActions);
  }

  await prefs.setStringList('userActions', actions);
}

/// Retrieve list of user actions
Future<List<String>> getUserActions() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('userActions') ?? [];
}

