import 'dart:convert';

import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:empresas/features/sign_in/data/models/investor_model.dart';
import 'package:empresas/shared/data/datasources/enterprises_remote_api.dart';
import 'package:empresas/shared/errors/exceptions.dart';
import 'package:empresas/shared/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture_reader.dart';
import 'enterprises_remote_api_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  late EnterprisesRemoteApi enterprisesApi;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    enterprisesApi = EnterprisesRemoteApi(client: mockHttpClient);
  });

  group('ListEnterprises', () {
    final String tQuery = 'Superstore';
    final List<Enterprise> tEnterprisesList = List<Enterprise>.empty(growable: true);
    final Map<String, dynamic> fixtureJson = json.decode(fixtureReader('enterprises.json'));
    fixtureJson['enterprises'].forEach((el) {
      tEnterprisesList.add(EnterpriseModel.fromJson(el));
    });

    test('Should get a list of ALL enterprises', () {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixtureReader('enterprises.json'), 200),
      );

      enterprisesApi.getAllEnterprises();

      verify(mockHttpClient.get(
        Uri.parse('https://empresas.ioasys.com.br/api/v1/enterprises'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ));
    });

    test('Should return List<Enterprise> with ALL enterprises when the response is HTTP 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixtureReader('enterprises.json'), 200),
      );

      final result = await enterprisesApi.getAllEnterprises();

      expect(result, tEnterprisesList);
    });

    test('Should thrown a ServerException on getAllEnterprises when the response is NOT HTTP 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );

      final call = enterprisesApi.getAllEnterprises;

      expect(call, throwsA(TypeMatcher<ServerException>()));
    });

    test('Should get a list of SEARCHED enterprises', () {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixtureReader('enterprises.json'), 200),
      );

      enterprisesApi.searchEnterprises(tQuery);

      verify(mockHttpClient.get(
        Uri.parse('https://empresas.ioasys.com.br/api/v1/enterprises?name=$tQuery'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ));
    });

    test('Should return List<Enterprise> with SEARCHED enterprises when the response is HTTP 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixtureReader('enterprises.json'), 200),
      );

      final result = await enterprisesApi.searchEnterprises(tQuery);

      expect(result, tEnterprisesList);
    });

    test('Should thrown a ServerException on searchEnterprises when the response is NOT HTTP 200',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );

      final call = enterprisesApi.searchEnterprises;

      expect(call(tQuery), throwsA(TypeMatcher<ServerException>()));
    });
  });

  group('SignIn', () {
    final String tEmail = 'testeapple@ioasys.com.br';
    final String tPassword = '1234';
    final Map<String, dynamic> tRequestBody = <String, dynamic>{
      'email': tEmail,
      'password': tPassword,
    };
    final InvestorModel tInvestor = InvestorModel.fromJson(
      json.decode(fixtureReader('user_success.json'))['investor'],
    );

    test('Should perform a sign in', () {
      when(mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(fixtureReader('user_success.json'), 200),
      );

      enterprisesApi.signIn(tEmail, tPassword);

      verify(mockHttpClient.post(
        Uri.parse('https://empresas.ioasys.com.br/api/v1/users/auth/sign_in'),
        body: json.encode(tRequestBody),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ));
    });

    test('Should return a Investor when the response is HTTP 200 and the sign in was successful',
        () async {
      when(mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(fixtureReader('user_success.json'), 200),
      );

      final result = await enterprisesApi.signIn(tEmail, tPassword);

      expect(result, tInvestor);
    });

    test(
        'Should throw a SignInFailure when the response is HTTP 200 and the sign in was NOT successful',
        () async {
      when(mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(fixtureReader('user_fail.json'), 200),
      );

      final call = enterprisesApi.signIn(tEmail, tPassword);

      expect(call, throwsA(TypeMatcher<SignInFailure>()));
    });

    test('Should thrown a ServerException on signIn when the response is NOT HTTP 200', () async {
      when(mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );

      final call = enterprisesApi.signIn(tEmail, tPassword);

      expect(call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
