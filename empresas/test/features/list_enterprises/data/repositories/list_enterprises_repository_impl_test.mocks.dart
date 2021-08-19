// Mocks generated by Mockito 5.0.14 from annotations
// in empresas/test/features/list_enterprises/data/repositories/list_enterprises_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:empresas/features/list_enterprises/data/datasource/list_enterprises_datasource.dart'
    as _i2;
import 'package:empresas/features/list_enterprises/data/models/enterprise_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ListEnterprisesDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockListEnterprisesDatasource extends _i1.Mock
    implements _i2.ListEnterprisesDatasource {
  MockListEnterprisesDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.EnterpriseModel>> searchEnterprises(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchEnterprises, [query]),
              returnValue: Future<List<_i4.EnterpriseModel>>.value(
                  <_i4.EnterpriseModel>[]))
          as _i3.Future<List<_i4.EnterpriseModel>>);
  @override
  _i3.Future<List<_i4.EnterpriseModel>> getAllEnterprises() =>
      (super.noSuchMethod(Invocation.method(#getAllEnterprises, []),
              returnValue: Future<List<_i4.EnterpriseModel>>.value(
                  <_i4.EnterpriseModel>[]))
          as _i3.Future<List<_i4.EnterpriseModel>>);
  @override
  String toString() => super.toString();
}
