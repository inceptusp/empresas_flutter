import 'dart:convert';

import 'package:empresas/features/sign_in/data/models/investor_model.dart';
import 'package:empresas/features/sign_in/domain/entities/investor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  final InvestorModel tInvestorModel = InvestorModel(
    id: 1,
    name: 'Teste Apple',
    email: 'testeapple@ioasys.com.br',
    city: 'BH',
    country: 'Brasil',
    balance: 1000000.0,
    photo: null,
    portfolioEnterprisesNumber: 0,
    portfolioEnterprises: [],
    portfolioValue: 1000000.0,
    firstAccess: false,
    superAngel: false,
  );

  test('Investor model should be a subclass of Investor entity', () {
    expect(tInvestorModel, isA<Investor>());
  });

  group('Investor model from JSON', () {
    test('Should return a investor', () {
      final Map<String, dynamic> decodedJson = json.decode(fixtureReader('user_success.json'));

      final InvestorModel investor = InvestorModel.fromJson(decodedJson['investor']);

      expect(investor, tInvestorModel);
    });
  });

  group('Investor model to JSON', () {
    test('Should return a JSON map from the provided InvestorModel', () {
      final Map<String, dynamic> result = tInvestorModel.toJson();

      final Map<String, dynamic> expectedMap = <String, dynamic>{
        'id': 1,
        'investor_name': 'Teste Apple',
        'email': 'testeapple@ioasys.com.br',
        'city': 'BH',
        'country': 'Brasil',
        'balance': 1000000.0,
        'photo': null,
        'portfolio': {'enterprises_number': 0, 'enterprises': []},
        'portfolio_value': 1000000.0,
        'first_access': false,
        'super_angel': false
      };
      expect(result, expectedMap);
    });
  });
}
