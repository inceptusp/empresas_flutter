// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$enterprisesAtom = Atom(name: '_HomeControllerBase.enterprises');

  @override
  List<Enterprise>? get enterprises {
    _$enterprisesAtom.reportRead();
    return super.enterprises;
  }

  @override
  set enterprises(List<Enterprise>? value) {
    _$enterprisesAtom.reportWrite(value, super.enterprises, () {
      super.enterprises = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_HomeControllerBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$searchErrorAtom = Atom(name: '_HomeControllerBase.searchError');

  @override
  String? get searchError {
    _$searchErrorAtom.reportRead();
    return super.searchError;
  }

  @override
  set searchError(String? value) {
    _$searchErrorAtom.reportWrite(value, super.searchError, () {
      super.searchError = value;
    });
  }

  final _$searchEnterprisesAsyncAction =
      AsyncAction('_HomeControllerBase.searchEnterprises');

  @override
  Future<void> searchEnterprises(String query) {
    return _$searchEnterprisesAsyncAction
        .run(() => super.searchEnterprises(query));
  }

  @override
  String toString() {
    return '''
enterprises: ${enterprises},
isSearching: ${isSearching},
searchError: ${searchError}
    ''';
  }
}
