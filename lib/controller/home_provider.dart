import 'package:flutter/material.dart';
import 'package:flutter_machine_test_alisons/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<ProductModel?> fetchData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setLoading(true);
    });

    try {
      final userData = await _getDataId();
      if (userData != null) {
        final id = userData['customerdata']['id'] ?? "";
        final token = userData['customerdata']['token'] ?? "";
        return await _fetchHomeData(id, token);
      }
    } catch (error) {
      print("Error fetching data: $error");
      return null;
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _setLoading(false);
      });
    }
    return null;
  }

  Future<ProductModel?> _fetchHomeData(String id, String token) async {
    final url =
        'https://swan.alisonsnewdemo.online/api/home?id=$id&token=$token';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(data);
      return ProductModel.fromJson(data);
    } else {
      print("Failed to load home data.");
      return null;
    }
  }

  Future<Map<String, dynamic>?> _getDataId() async {
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
