import 'package:flutter/material.dart';
import 'package:flutter_machine_test_alisons/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  ProductModel? productModel;
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
      productModel = null;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _fetchHomeData(String id, String token) async {
    final url =
        'https://swan.alisonsnewdemo.online/api/home?id=$id&token=$token';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      productModel = ProductModel.fromJson(data);
      notifyListeners();
    } else {
      print("Failed to load home data.");
      productModel = null;
    }
  }

  Future<Map<String, dynamic>?> _getUserData() async {
    try {
      final response = await http.post(
        Uri.parse("https://swan.alisonsnewdemo.online/api/guest-login/en"),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print("Error fetching user data.");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
