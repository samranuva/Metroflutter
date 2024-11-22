import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  final deviceStorage = GetStorage();
  
  static const String _baseUrl = 'https://122.252.226.254:5101/api';
  //static const String _baseUrl = 'https://devapp.tsavaari.com/LTProject';
  

  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String baseUrl, String endpoint) async {
    print('$_baseUrl/$endpoint');
    final response = await http
        .get(Uri.parse('$baseUrl/$endpoint'))
        .timeout(const Duration(seconds: 5));

    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String baseUrl, String endpoint, dynamic data) async {

    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: data != null ? json.encode(data) : null,
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
      print("Response Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("Response Body: ${response.body}");
      return json.decode(response.body);
    } else {
      print("Login failed with status: ${response.statusCode}");
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
