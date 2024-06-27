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
  bool get isLoading => throw _privateConstructorUsedError;
  List<FileMetadata> get lastSeenFiles => throw _privateConstructorUsedError;
  FileMetadata? get openPdf => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<FileMetadata> lastSeenFiles,
      FileMetadata? openPdf});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lastSeenFiles = null,
    Object? openPdf = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeenFiles: null == lastSeenFiles
          ? _value.lastSeenFiles
          : lastSeenFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>,
      openPdf: freezed == openPdf
          ? _value.openPdf
          : openPdf // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<FileMetadata> lastSeenFiles,
      FileMetadata? openPdf});
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? lastSeenFiles = null,
    Object? openPdf = freezed,
  }) {
    return _then(_$DashboardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeenFiles: null == lastSeenFiles
          ? _value._lastSeenFiles
          : lastSeenFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>,
      openPdf: freezed == openPdf
          ? _value.openPdf
          : openPdf // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {this.isLoading = false,
      final List<FileMetadata> lastSeenFiles = const [],
      this.openPdf = null})
      : _lastSeenFiles = lastSeenFiles;

  @override
  @JsonKey()
  final bool isLoading;
  final List<FileMetadata> _lastSeenFiles;
  @override
  @JsonKey()
  List<FileMetadata> get lastSeenFiles {
    if (_lastSeenFiles is EqualUnmodifiableListView) return _lastSeenFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastSeenFiles);
  }

  @override
  @JsonKey()
  final FileMetadata? openPdf;

  @override
  String toString() {
    return 'DashboardState(isLoading: $isLoading, lastSeenFiles: $lastSeenFiles, openPdf: $openPdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._lastSeenFiles, _lastSeenFiles) &&
            (identical(other.openPdf, openPdf) || other.openPdf == openPdf));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_lastSeenFiles), openPdf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final bool isLoading,
      final List<FileMetadata> lastSeenFiles,
      final FileMetadata? openPdf}) = _$DashboardStateImpl;

  @override
  bool get isLoading;
  @override
  List<FileMetadata> get lastSeenFiles;
  @override
  FileMetadata? get openPdf;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
