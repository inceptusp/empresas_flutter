import 'dart:convert';
import 'dart:io';

import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart';
import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:empresas/features/sign_in/data/models/investor_model.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:http/http.dart' as http;

class EnterprisesRemoteApi implements SignInDatasource, ListEnterprisesDatasource {
  static const String _kServer = 'https://empresas.ioasys.com.br';
  static const String _kApi = '/api/v1';
  static final Map<String, String> _authHeaders = <String, String>{};
  final http.Client client;

  EnterprisesRemoteApi({required this.client});

  @override
  Future<List<EnterpriseModel>> getAllEnterprises() async {
    final response = await client.get(
      Uri.parse('$_kServer$_kApi/enterprises'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }..addAll(_authHeaders),
    );

    if (response.statusCode == 200) {
      final List<EnterpriseModel> enterprisesList = List<EnterpriseModel>.empty(growable: true);
      final Map<String, dynamic> bodyJson = json.decode(response.body);
      bodyJson['enterprises'].forEach((el) {
        el['photo'] = el['photo'] == null ? null : _kServer + el['photo'];
        enterprisesList.add(EnterpriseModel.fromJson(el));
      });

      return enterprisesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EnterpriseModel>> searchEnterprises(String query) async {
    final response = await client.get(
      Uri.parse('$_kServer$_kApi/enterprises?name=$query'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }..addAll(_authHeaders),
    );

    if (response.statusCode == 200) {
      final List<EnterpriseModel> enterprisesList = List<EnterpriseModel>.empty(growable: true);
      final Map<String, dynamic> bodyJson = json.decode(response.body);
      bodyJson['enterprises'].forEach((el) {
        el['photo'] = el['photo'] == null ? null : _kServer + el['photo'];
        enterprisesList.add(EnterpriseModel.fromJson(el));
      });

      return enterprisesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<InvestorModel> signIn(String email, String password) async {
    Map<String, dynamic> requestBody = <String, dynamic>{
      'email': email,
      'password': password,
    };

    try {
      final response = await client.post(
        Uri.parse('$_kServer$_kApi/users/auth/sign_in'),
        body: json.encode(requestBody),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyJson = json.decode(response.body);
        if (bodyJson['success']) {
          _authHeaders['uid'] = response.headers['uid']!;
          _authHeaders['access-token'] = response.headers['access-token']!;
          _authHeaders['client'] = response.headers['client']!;
          InvestorModel investor = InvestorModel.fromJson(bodyJson['investor']);
          return investor;
        } else {
          throw SignInFailure(message: bodyJson['errors'].first);
        }
      } else if (response.statusCode == 401) {
        final Map<String, dynamic> bodyJson = json.decode(response.body);
        throw SignInFailure(message: bodyJson['errors'].first);
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ConnectionException();
    }
  }
}
