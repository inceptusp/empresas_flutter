import 'dart:convert';

import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  final EnterpriseModel tEnterpriseModel = EnterpriseModel(
    id: 1,
    ownEnterprise: false,
    name: 'Superstore',
    description: 'Description test',
    city: 'Bristol',
    country: 'UK',
    value: 100,
    sharePrice: 100.0,
    enterpriseTypeId: 1,
    enterpriseTypeName: 'Commerce',
  );

  test('Enterprise model should be a subclass of Enterprise entity', () {
    expect(tEnterpriseModel, isA<Enterprise>());
  });

  group('Enterprise model from JSON', () {
    test('Should return a list of enterprises when there is one or more enterprises', () {
      final Map<String, dynamic> decodedJson = json.decode(fixtureReader('enterprises.json'));

      List<Enterprise> enterprisesList = List<Enterprise>.empty(growable: true);
      decodedJson['enterprises'].forEach((el) {
        enterprisesList.add(EnterpriseModel.fromJson(el));
      });

      // 1000 is an arbritary selected high number just to use the inInclusiveRange matcher to test if there is exactly one or more items on the list
      expect(enterprisesList.length, inInclusiveRange(1, 1000));
      expect(enterprisesList[0], isA<Enterprise>());
      expect(enterprisesList[0], tEnterpriseModel);
    });

    test('Should return an empty list of enterprises when there is not enterprises', () {
      final Map<String, dynamic> decodedJson = json.decode(fixtureReader('enterprises_empty.json'));

      List<Enterprise> enterprisesList = List<Enterprise>.empty(growable: true);
      decodedJson['enterprises'].forEach((el) {
        enterprisesList.add(EnterpriseModel.fromJson(el));
      });

      expect(enterprisesList.length, 0);
      expect(enterprisesList.isEmpty, true);
    });
  });

  group('Enterprise model to JSON', () {
    test('Should return a JSON map from the provided EnterpriseModel', () {
      final Map<String, dynamic> result = tEnterpriseModel.toJson();

      final Map<String, dynamic> expectedMap = <String, dynamic>{
        'id': 1,
        'email_enterprise': null,
        'facebook': null,
        'twitter': null,
        'linkedin': null,
        'phone': null,
        'own_enterprise': false,
        'enterprise_name': 'Superstore',
        'photo': null,
        'description': 'Description test',
        'city': 'Bristol',
        'country': 'UK',
        'value': 100,
        'share_price': 100.0,
        'enterprise_type': {'id': 1, 'enterprise_type_name': 'Commerce'}
      };
      expect(result, expectedMap);
    });
  });
}
