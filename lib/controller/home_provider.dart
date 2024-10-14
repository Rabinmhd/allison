import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider with ChangeNotifier {
  Map<String, dynamic>? data;
  bool isLoading = false;

  Future<void> fetchData() async {
    _setLoading(true);

    try {
      final userData = await _getUserData();
      if (userData != null) {
        final id = userData['customerdata']['id'] ?? "";
        final token = userData['customerdata']['token'] ?? "";
        await _fetchHomeData(id, token);
      }
    } catch (error) {
      print("Error fetching data: $error");
      data = null;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _fetchHomeData(String id, String token) async {
    final url =
        'https://swan.alisonsnewdemo.online/api/home?id=$id&token=$token';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
    } else {
      print("Failed to load home data.");
      data = null;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>?> _getUserData() async {
    final response = await http.get(
      Uri.parse("https://swan.alisonsnewdemo.online/api/guest-login/en"),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error fetching user data.");
      return null;
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
