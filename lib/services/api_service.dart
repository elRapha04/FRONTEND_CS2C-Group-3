import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'backendcs2c-group-3-production.up.railway.app';

  static Future fetchAccounts() async {
    final response = await http.get(Uri.parse('$baseUrl/accounts/'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch accounts');
    }
  }
}
