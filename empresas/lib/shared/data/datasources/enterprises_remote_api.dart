import 'dart:convert';

import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:http/http.dart' as http;

class EnterprisesApi {
  static const String server = 'https://empresas.ioasys.com.br/';
  static const String _apiVersion = 'v1';
  static final Map<String, String> _authHeaders = <String, String>{};

  /// Does a sign in and returns the response JSON as a map. Throws on connection error
  static Future<Map<String, dynamic>> signIn(String email, String password) async {
    Map<String, dynamic> requestBody = <String, dynamic>{
      'email': email,
      'password': password,
    };
    http.Response response = await http.post(
      Uri.parse('$server/api/$_apiVersion/users/auth/sign_in'),
      body: json.encode(requestBody),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      _authHeaders['uid'] = response.headers['uid']!;
      _authHeaders['access-token'] = response.headers['access-token']!;
      _authHeaders['client'] = response.headers['client']!;
    }
    return json.decode(response.body);
  }

  /// Does a search and return a list of searched enterprises.
  /// Returns an empty list on communication errors or when nothing is found and throws on connection error.
  static Future<List<Enterprise>> search(String query) async {
    http.Response response = await http.get(
      Uri.parse('$server/api/$_apiVersion/enterprises?name=$query'),
      headers: <String, String>{'Content-Type': 'application/json'}..addAll(_authHeaders),
    );
    List<Enterprise> enterprises = List<Enterprise>.empty(growable: true);
    if (response.statusCode == 200) {
      List<dynamic> enterprisesFromApi = json.decode(response.body)['enterprises'];
      for (var item in enterprisesFromApi) {
        enterprises.add(EnterpriseModel.fromJson(item));
      }
    }
    return enterprises;
  }
}
