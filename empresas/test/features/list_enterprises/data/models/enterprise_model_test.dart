import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart';
import 'package:empresas/features/list_enterprises/domain/entities/enterprise.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final EnterpriseModel tEnterpriseModel = EnterpriseModel(
    id: 1,
    ownEnterprise: false,
    name: 'superstore',
    description: 'description',
    value: 100,
    sharePrice: 100.0,
    enterpriseTypeId: 1,
    enterpriseTypeName: 'commerce',
  );

  test(
    'Enterprise model should be a subclass of Enterprise entity',
    () {
      expect(tEnterpriseModel, isA<Enterprise>());
    },
  );
}
