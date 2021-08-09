// Mocks generated by Mockito 5.0.13 from annotations
// in empresas/test/features/sign_in/domain/usecases/sign_in_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:empresas/features/sign_in/domain/entities/investor.dart' as _i6;
import 'package:empresas/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i3;
import 'package:empresas/shared/utils/failure.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [SignInRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInRepository extends _i1.Mock implements _i3.SignInRepository {
  MockSignInRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Investor>> signIn(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#signIn, [email, password]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Investor>>.value(
                  _FakeEither<_i5.Failure, _i6.Investor>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Investor>>);
  @override
  String toString() => super.toString();
}