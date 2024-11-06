// Mocks generated by Mockito 5.4.4 from annotations
// in just_pdf/test/dashboard_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i8;

import 'package:dartz/dartz.dart' as _i2;
import 'package:just_pdf/common/domain/failure.dart' as _i5;
import 'package:just_pdf/dashboard/domain/file_metadata.dart' as _i6;
import 'package:just_pdf/dashboard/domain/i_dashboard_repository.dart' as _i3;
import 'package:just_pdf/dashboard/domain/options.dart' as _i9;
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart'
    as _i7;
import 'package:just_pdf/printing/domain/i_printing_repository.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IDashboardRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIDashboardRepository extends _i1.Mock
    implements _i3.IDashboardRepository {
  MockIDashboardRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> requestStoragePermission() => (super.noSuchMethod(
        Invocation.method(
          #requestStoragePermission,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> checkStoragePermission() => (super.noSuchMethod(
        Invocation.method(
          #checkStoragePermission,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.FileMetadata?>> getPdfFromIntent() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPdfFromIntent,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.FileMetadata?>>.value(
                _FakeEither_0<_i5.Failure, _i6.FileMetadata?>(
          this,
          Invocation.method(
            #getPdfFromIntent,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.FileMetadata?>>);
}

/// A class which mocks [ILocalStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalStorageRepository extends _i1.Mock
    implements _i7.ILocalStorageRepository {
  MockILocalStorageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> saveFile(_i6.FileMetadata? fileMetadata) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFile,
          [fileMetadata],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> saveFavorite(_i6.FileMetadata? fileMetadata) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavorite,
          [fileMetadata],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteFile(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  List<_i6.FileMetadata> getFiles() => (super.noSuchMethod(
        Invocation.method(
          #getFiles,
          [],
        ),
        returnValue: <_i6.FileMetadata>[],
      ) as List<_i6.FileMetadata>);

  @override
  _i4.Future<void> saveLocale(_i8.Locale? locale) => (super.noSuchMethod(
        Invocation.method(
          #saveLocale,
          [locale],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> saveLastOption(_i9.Options? option) => (super.noSuchMethod(
        Invocation.method(
          #saveLastOption,
          [option],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [IPrintingRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPrintingRepository extends _i1.Mock
    implements _i10.IPrintingRepository {
  MockIPrintingRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> print(
          _i6.FileMetadata? fileMetadata) =>
      (super.noSuchMethod(
        Invocation.method(
          #print,
          [fileMetadata],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #print,
            [fileMetadata],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> share(
          List<_i6.FileMetadata>? fileMetadataList) =>
      (super.noSuchMethod(
        Invocation.method(
          #share,
          [fileMetadataList],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #share,
            [fileMetadataList],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
}
