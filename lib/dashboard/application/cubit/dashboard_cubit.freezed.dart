// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FileMetadata> lastSeenFiles) lastSeenFiles,
    required TResult Function(List<FileMetadata> alphabeticalFiles)
        alphabeticalOrderFiles,
    required TResult Function(FileMetadata openPdf) openPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult? Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult? Function(FileMetadata openPdf)? openPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult Function(FileMetadata openPdf)? openPdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LastSeenFiles value) lastSeenFiles,
    required TResult Function(_AlphabeticalOrderFiles value)
        alphabeticalOrderFiles,
    required TResult Function(_OpenPdf value) openPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LastSeenFiles value)? lastSeenFiles,
    TResult? Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult? Function(_OpenPdf value)? openPdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LastSeenFiles value)? lastSeenFiles,
    TResult Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult Function(_OpenPdf value)? openPdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FileMetadata> lastSeenFiles) lastSeenFiles,
    required TResult Function(List<FileMetadata> alphabeticalFiles)
        alphabeticalOrderFiles,
    required TResult Function(FileMetadata openPdf) openPdf,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult? Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult? Function(FileMetadata openPdf)? openPdf,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult Function(FileMetadata openPdf)? openPdf,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LastSeenFiles value) lastSeenFiles,
    required TResult Function(_AlphabeticalOrderFiles value)
        alphabeticalOrderFiles,
    required TResult Function(_OpenPdf value) openPdf,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LastSeenFiles value)? lastSeenFiles,
    TResult? Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult? Function(_OpenPdf value)? openPdf,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LastSeenFiles value)? lastSeenFiles,
    TResult Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult Function(_OpenPdf value)? openPdf,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DashboardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LastSeenFilesImplCopyWith<$Res> {
  factory _$$LastSeenFilesImplCopyWith(
          _$LastSeenFilesImpl value, $Res Function(_$LastSeenFilesImpl) then) =
      __$$LastSeenFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FileMetadata> lastSeenFiles});
}

/// @nodoc
class __$$LastSeenFilesImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LastSeenFilesImpl>
    implements _$$LastSeenFilesImplCopyWith<$Res> {
  __$$LastSeenFilesImplCopyWithImpl(
      _$LastSeenFilesImpl _value, $Res Function(_$LastSeenFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSeenFiles = null,
  }) {
    return _then(_$LastSeenFilesImpl(
      lastSeenFiles: null == lastSeenFiles
          ? _value._lastSeenFiles
          : lastSeenFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>,
    ));
  }
}

/// @nodoc

class _$LastSeenFilesImpl implements _LastSeenFiles {
  const _$LastSeenFilesImpl({final List<FileMetadata> lastSeenFiles = const []})
      : _lastSeenFiles = lastSeenFiles;

  final List<FileMetadata> _lastSeenFiles;
  @override
  @JsonKey()
  List<FileMetadata> get lastSeenFiles {
    if (_lastSeenFiles is EqualUnmodifiableListView) return _lastSeenFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastSeenFiles);
  }

  @override
  String toString() {
    return 'DashboardState.lastSeenFiles(lastSeenFiles: $lastSeenFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastSeenFilesImpl &&
            const DeepCollectionEquality()
                .equals(other._lastSeenFiles, _lastSeenFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lastSeenFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastSeenFilesImplCopyWith<_$LastSeenFilesImpl> get copyWith =>
      __$$LastSeenFilesImplCopyWithImpl<_$LastSeenFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FileMetadata> lastSeenFiles) lastSeenFiles,
    required TResult Function(List<FileMetadata> alphabeticalFiles)
        alphabeticalOrderFiles,
    required TResult Function(FileMetadata openPdf) openPdf,
  }) {
    return lastSeenFiles(this.lastSeenFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult? Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult? Function(FileMetadata openPdf)? openPdf,
  }) {
    return lastSeenFiles?.call(this.lastSeenFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult Function(FileMetadata openPdf)? openPdf,
    required TResult orElse(),
  }) {
    if (lastSeenFiles != null) {
      return lastSeenFiles(this.lastSeenFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LastSeenFiles value) lastSeenFiles,
    required TResult Function(_AlphabeticalOrderFiles value)
        alphabeticalOrderFiles,
    required TResult Function(_OpenPdf value) openPdf,
  }) {
    return lastSeenFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LastSeenFiles value)? lastSeenFiles,
    TResult? Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult? Function(_OpenPdf value)? openPdf,
  }) {
    return lastSeenFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LastSeenFiles value)? lastSeenFiles,
    TResult Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult Function(_OpenPdf value)? openPdf,
    required TResult orElse(),
  }) {
    if (lastSeenFiles != null) {
      return lastSeenFiles(this);
    }
    return orElse();
  }
}

abstract class _LastSeenFiles implements DashboardState {
  const factory _LastSeenFiles({final List<FileMetadata> lastSeenFiles}) =
      _$LastSeenFilesImpl;

  List<FileMetadata> get lastSeenFiles;
  @JsonKey(ignore: true)
  _$$LastSeenFilesImplCopyWith<_$LastSeenFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlphabeticalOrderFilesImplCopyWith<$Res> {
  factory _$$AlphabeticalOrderFilesImplCopyWith(
          _$AlphabeticalOrderFilesImpl value,
          $Res Function(_$AlphabeticalOrderFilesImpl) then) =
      __$$AlphabeticalOrderFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FileMetadata> alphabeticalFiles});
}

/// @nodoc
class __$$AlphabeticalOrderFilesImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$AlphabeticalOrderFilesImpl>
    implements _$$AlphabeticalOrderFilesImplCopyWith<$Res> {
  __$$AlphabeticalOrderFilesImplCopyWithImpl(
      _$AlphabeticalOrderFilesImpl _value,
      $Res Function(_$AlphabeticalOrderFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphabeticalFiles = null,
  }) {
    return _then(_$AlphabeticalOrderFilesImpl(
      alphabeticalFiles: null == alphabeticalFiles
          ? _value._alphabeticalFiles
          : alphabeticalFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>,
    ));
  }
}

/// @nodoc

class _$AlphabeticalOrderFilesImpl implements _AlphabeticalOrderFiles {
  const _$AlphabeticalOrderFilesImpl(
      {final List<FileMetadata> alphabeticalFiles = const []})
      : _alphabeticalFiles = alphabeticalFiles;

  final List<FileMetadata> _alphabeticalFiles;
  @override
  @JsonKey()
  List<FileMetadata> get alphabeticalFiles {
    if (_alphabeticalFiles is EqualUnmodifiableListView)
      return _alphabeticalFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alphabeticalFiles);
  }

  @override
  String toString() {
    return 'DashboardState.alphabeticalOrderFiles(alphabeticalFiles: $alphabeticalFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlphabeticalOrderFilesImpl &&
            const DeepCollectionEquality()
                .equals(other._alphabeticalFiles, _alphabeticalFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_alphabeticalFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlphabeticalOrderFilesImplCopyWith<_$AlphabeticalOrderFilesImpl>
      get copyWith => __$$AlphabeticalOrderFilesImplCopyWithImpl<
          _$AlphabeticalOrderFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FileMetadata> lastSeenFiles) lastSeenFiles,
    required TResult Function(List<FileMetadata> alphabeticalFiles)
        alphabeticalOrderFiles,
    required TResult Function(FileMetadata openPdf) openPdf,
  }) {
    return alphabeticalOrderFiles(alphabeticalFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult? Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult? Function(FileMetadata openPdf)? openPdf,
  }) {
    return alphabeticalOrderFiles?.call(alphabeticalFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult Function(FileMetadata openPdf)? openPdf,
    required TResult orElse(),
  }) {
    if (alphabeticalOrderFiles != null) {
      return alphabeticalOrderFiles(alphabeticalFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LastSeenFiles value) lastSeenFiles,
    required TResult Function(_AlphabeticalOrderFiles value)
        alphabeticalOrderFiles,
    required TResult Function(_OpenPdf value) openPdf,
  }) {
    return alphabeticalOrderFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LastSeenFiles value)? lastSeenFiles,
    TResult? Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult? Function(_OpenPdf value)? openPdf,
  }) {
    return alphabeticalOrderFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LastSeenFiles value)? lastSeenFiles,
    TResult Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult Function(_OpenPdf value)? openPdf,
    required TResult orElse(),
  }) {
    if (alphabeticalOrderFiles != null) {
      return alphabeticalOrderFiles(this);
    }
    return orElse();
  }
}

abstract class _AlphabeticalOrderFiles implements DashboardState {
  const factory _AlphabeticalOrderFiles(
          {final List<FileMetadata> alphabeticalFiles}) =
      _$AlphabeticalOrderFilesImpl;

  List<FileMetadata> get alphabeticalFiles;
  @JsonKey(ignore: true)
  _$$AlphabeticalOrderFilesImplCopyWith<_$AlphabeticalOrderFilesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenPdfImplCopyWith<$Res> {
  factory _$$OpenPdfImplCopyWith(
          _$OpenPdfImpl value, $Res Function(_$OpenPdfImpl) then) =
      __$$OpenPdfImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FileMetadata openPdf});
}

/// @nodoc
class __$$OpenPdfImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$OpenPdfImpl>
    implements _$$OpenPdfImplCopyWith<$Res> {
  __$$OpenPdfImplCopyWithImpl(
      _$OpenPdfImpl _value, $Res Function(_$OpenPdfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openPdf = null,
  }) {
    return _then(_$OpenPdfImpl(
      null == openPdf
          ? _value.openPdf
          : openPdf // ignore: cast_nullable_to_non_nullable
              as FileMetadata,
    ));
  }
}

/// @nodoc

class _$OpenPdfImpl implements _OpenPdf {
  const _$OpenPdfImpl(this.openPdf);

  @override
  final FileMetadata openPdf;

  @override
  String toString() {
    return 'DashboardState.openPdf(openPdf: $openPdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenPdfImpl &&
            (identical(other.openPdf, openPdf) || other.openPdf == openPdf));
  }

  @override
  int get hashCode => Object.hash(runtimeType, openPdf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenPdfImplCopyWith<_$OpenPdfImpl> get copyWith =>
      __$$OpenPdfImplCopyWithImpl<_$OpenPdfImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FileMetadata> lastSeenFiles) lastSeenFiles,
    required TResult Function(List<FileMetadata> alphabeticalFiles)
        alphabeticalOrderFiles,
    required TResult Function(FileMetadata openPdf) openPdf,
  }) {
    return openPdf(this.openPdf);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult? Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult? Function(FileMetadata openPdf)? openPdf,
  }) {
    return openPdf?.call(this.openPdf);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FileMetadata> lastSeenFiles)? lastSeenFiles,
    TResult Function(List<FileMetadata> alphabeticalFiles)?
        alphabeticalOrderFiles,
    TResult Function(FileMetadata openPdf)? openPdf,
    required TResult orElse(),
  }) {
    if (openPdf != null) {
      return openPdf(this.openPdf);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LastSeenFiles value) lastSeenFiles,
    required TResult Function(_AlphabeticalOrderFiles value)
        alphabeticalOrderFiles,
    required TResult Function(_OpenPdf value) openPdf,
  }) {
    return openPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LastSeenFiles value)? lastSeenFiles,
    TResult? Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult? Function(_OpenPdf value)? openPdf,
  }) {
    return openPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LastSeenFiles value)? lastSeenFiles,
    TResult Function(_AlphabeticalOrderFiles value)? alphabeticalOrderFiles,
    TResult Function(_OpenPdf value)? openPdf,
    required TResult orElse(),
  }) {
    if (openPdf != null) {
      return openPdf(this);
    }
    return orElse();
  }
}

abstract class _OpenPdf implements DashboardState {
  const factory _OpenPdf(final FileMetadata openPdf) = _$OpenPdfImpl;

  FileMetadata get openPdf;
  @JsonKey(ignore: true)
  _$$OpenPdfImplCopyWith<_$OpenPdfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
