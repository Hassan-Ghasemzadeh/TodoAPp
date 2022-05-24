// Mocks generated by Mockito 5.2.0 from annotations
// in todoappflutter/test/src/domain/usecases/use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todoappflutter/src/data/models/person.dart' as _i5;
import 'package:todoappflutter/src/domain/entities/person_datasource.dart'
    as _i2;
import 'package:todoappflutter/src/domain/repositories/base_person_impl.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePersonDataSource_0 extends _i1.Fake implements _i2.PersonDataSource {
}

/// A class which mocks [PersonRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonRepositoryImpl extends _i1.Mock
    implements _i3.PersonRepositoryImpl {
  MockPersonRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PersonDataSource get model =>
      (super.noSuchMethod(Invocation.getter(#model),
          returnValue: _FakePersonDataSource_0()) as _i2.PersonDataSource);
  @override
  _i4.Future<bool> delete(_i5.Person? person) =>
      (super.noSuchMethod(Invocation.method(#delete, [person]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<List<_i5.Person>> getAllPersons() =>
      (super.noSuchMethod(Invocation.method(#getAllPersons, []),
              returnValue: Future<List<_i5.Person>>.value(<_i5.Person>[]))
          as _i4.Future<List<_i5.Person>>);
  @override
  _i4.Future<void> insert(_i5.Person? person) =>
      (super.noSuchMethod(Invocation.method(#insert, [person]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> update(_i5.Person? person) =>
      (super.noSuchMethod(Invocation.method(#update, [person]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}
