// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'js.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JsEvalOptions {
  bool get global => throw _privateConstructorUsedError;
  bool get strict => throw _privateConstructorUsedError;
  bool get backtraceBarrier => throw _privateConstructorUsedError;
  bool get promise => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsEvalOptions value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsEvalOptions value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsEvalOptions value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of JsEvalOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JsEvalOptionsCopyWith<JsEvalOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsEvalOptionsCopyWith<$Res> {
  factory $JsEvalOptionsCopyWith(
          JsEvalOptions value, $Res Function(JsEvalOptions) then) =
      _$JsEvalOptionsCopyWithImpl<$Res, JsEvalOptions>;
  @useResult
  $Res call({bool global, bool strict, bool backtraceBarrier, bool promise});
}

/// @nodoc
class _$JsEvalOptionsCopyWithImpl<$Res, $Val extends JsEvalOptions>
    implements $JsEvalOptionsCopyWith<$Res> {
  _$JsEvalOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JsEvalOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? global = null,
    Object? strict = null,
    Object? backtraceBarrier = null,
    Object? promise = null,
  }) {
    return _then(_value.copyWith(
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool,
      strict: null == strict
          ? _value.strict
          : strict // ignore: cast_nullable_to_non_nullable
              as bool,
      backtraceBarrier: null == backtraceBarrier
          ? _value.backtraceBarrier
          : backtraceBarrier // ignore: cast_nullable_to_non_nullable
              as bool,
      promise: null == promise
          ? _value.promise
          : promise // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JsEvalOptionsImplCopyWith<$Res>
    implements $JsEvalOptionsCopyWith<$Res> {
  factory _$$JsEvalOptionsImplCopyWith(
          _$JsEvalOptionsImpl value, $Res Function(_$JsEvalOptionsImpl) then) =
      __$$JsEvalOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool global, bool strict, bool backtraceBarrier, bool promise});
}

/// @nodoc
class __$$JsEvalOptionsImplCopyWithImpl<$Res>
    extends _$JsEvalOptionsCopyWithImpl<$Res, _$JsEvalOptionsImpl>
    implements _$$JsEvalOptionsImplCopyWith<$Res> {
  __$$JsEvalOptionsImplCopyWithImpl(
      _$JsEvalOptionsImpl _value, $Res Function(_$JsEvalOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsEvalOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? global = null,
    Object? strict = null,
    Object? backtraceBarrier = null,
    Object? promise = null,
  }) {
    return _then(_$JsEvalOptionsImpl(
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as bool,
      strict: null == strict
          ? _value.strict
          : strict // ignore: cast_nullable_to_non_nullable
              as bool,
      backtraceBarrier: null == backtraceBarrier
          ? _value.backtraceBarrier
          : backtraceBarrier // ignore: cast_nullable_to_non_nullable
              as bool,
      promise: null == promise
          ? _value.promise
          : promise // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$JsEvalOptionsImpl extends _JsEvalOptions {
  const _$JsEvalOptionsImpl(
      {required this.global,
      required this.strict,
      required this.backtraceBarrier,
      required this.promise})
      : super._();

  @override
  final bool global;
  @override
  final bool strict;
  @override
  final bool backtraceBarrier;
  @override
  final bool promise;

  @override
  String toString() {
    return 'JsEvalOptions.raw(global: $global, strict: $strict, backtraceBarrier: $backtraceBarrier, promise: $promise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsEvalOptionsImpl &&
            (identical(other.global, global) || other.global == global) &&
            (identical(other.strict, strict) || other.strict == strict) &&
            (identical(other.backtraceBarrier, backtraceBarrier) ||
                other.backtraceBarrier == backtraceBarrier) &&
            (identical(other.promise, promise) || other.promise == promise));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, global, strict, backtraceBarrier, promise);

  /// Create a copy of JsEvalOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsEvalOptionsImplCopyWith<_$JsEvalOptionsImpl> get copyWith =>
      __$$JsEvalOptionsImplCopyWithImpl<_$JsEvalOptionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)
        raw,
  }) {
    return raw(global, strict, backtraceBarrier, promise);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)?
        raw,
  }) {
    return raw?.call(global, strict, backtraceBarrier, promise);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool global, bool strict, bool backtraceBarrier, bool promise)?
        raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(global, strict, backtraceBarrier, promise);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsEvalOptions value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsEvalOptions value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsEvalOptions value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }
}

abstract class _JsEvalOptions extends JsEvalOptions {
  const factory _JsEvalOptions(
      {required final bool global,
      required final bool strict,
      required final bool backtraceBarrier,
      required final bool promise}) = _$JsEvalOptionsImpl;
  const _JsEvalOptions._() : super._();

  @override
  bool get global;
  @override
  bool get strict;
  @override
  bool get backtraceBarrier;
  @override
  bool get promise;

  /// Create a copy of JsEvalOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsEvalOptionsImplCopyWith<_$JsEvalOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JsEvalResult {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsValue field0) ok,
    required TResult Function(String field0) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsValue field0)? ok,
    TResult? Function(String field0)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsValue field0)? ok,
    TResult Function(String field0)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsEvalResult_Ok value) ok,
    required TResult Function(JsEvalResult_Err value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsEvalResult_Ok value)? ok,
    TResult? Function(JsEvalResult_Err value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsEvalResult_Ok value)? ok,
    TResult Function(JsEvalResult_Err value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsEvalResultCopyWith<$Res> {
  factory $JsEvalResultCopyWith(
          JsEvalResult value, $Res Function(JsEvalResult) then) =
      _$JsEvalResultCopyWithImpl<$Res, JsEvalResult>;
}

/// @nodoc
class _$JsEvalResultCopyWithImpl<$Res, $Val extends JsEvalResult>
    implements $JsEvalResultCopyWith<$Res> {
  _$JsEvalResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JsEvalResult_OkImplCopyWith<$Res> {
  factory _$$JsEvalResult_OkImplCopyWith(_$JsEvalResult_OkImpl value,
          $Res Function(_$JsEvalResult_OkImpl) then) =
      __$$JsEvalResult_OkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JsValue field0});

  $JsValueCopyWith<$Res> get field0;
}

/// @nodoc
class __$$JsEvalResult_OkImplCopyWithImpl<$Res>
    extends _$JsEvalResultCopyWithImpl<$Res, _$JsEvalResult_OkImpl>
    implements _$$JsEvalResult_OkImplCopyWith<$Res> {
  __$$JsEvalResult_OkImplCopyWithImpl(
      _$JsEvalResult_OkImpl _value, $Res Function(_$JsEvalResult_OkImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$JsEvalResult_OkImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as JsValue,
    ));
  }

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JsValueCopyWith<$Res> get field0 {
    return $JsValueCopyWith<$Res>(_value.field0, (value) {
      return _then(_value.copyWith(field0: value));
    });
  }
}

/// @nodoc

class _$JsEvalResult_OkImpl extends JsEvalResult_Ok {
  const _$JsEvalResult_OkImpl(this.field0) : super._();

  @override
  final JsValue field0;

  @override
  String toString() {
    return 'JsEvalResult.ok(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsEvalResult_OkImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsEvalResult_OkImplCopyWith<_$JsEvalResult_OkImpl> get copyWith =>
      __$$JsEvalResult_OkImplCopyWithImpl<_$JsEvalResult_OkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsValue field0) ok,
    required TResult Function(String field0) err,
  }) {
    return ok(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsValue field0)? ok,
    TResult? Function(String field0)? err,
  }) {
    return ok?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsValue field0)? ok,
    TResult Function(String field0)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsEvalResult_Ok value) ok,
    required TResult Function(JsEvalResult_Err value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsEvalResult_Ok value)? ok,
    TResult? Function(JsEvalResult_Err value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsEvalResult_Ok value)? ok,
    TResult Function(JsEvalResult_Err value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class JsEvalResult_Ok extends JsEvalResult {
  const factory JsEvalResult_Ok(final JsValue field0) = _$JsEvalResult_OkImpl;
  const JsEvalResult_Ok._() : super._();

  @override
  JsValue get field0;

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsEvalResult_OkImplCopyWith<_$JsEvalResult_OkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JsEvalResult_ErrImplCopyWith<$Res> {
  factory _$$JsEvalResult_ErrImplCopyWith(_$JsEvalResult_ErrImpl value,
          $Res Function(_$JsEvalResult_ErrImpl) then) =
      __$$JsEvalResult_ErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$JsEvalResult_ErrImplCopyWithImpl<$Res>
    extends _$JsEvalResultCopyWithImpl<$Res, _$JsEvalResult_ErrImpl>
    implements _$$JsEvalResult_ErrImplCopyWith<$Res> {
  __$$JsEvalResult_ErrImplCopyWithImpl(_$JsEvalResult_ErrImpl _value,
      $Res Function(_$JsEvalResult_ErrImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$JsEvalResult_ErrImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JsEvalResult_ErrImpl extends JsEvalResult_Err {
  const _$JsEvalResult_ErrImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'JsEvalResult.err(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsEvalResult_ErrImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsEvalResult_ErrImplCopyWith<_$JsEvalResult_ErrImpl> get copyWith =>
      __$$JsEvalResult_ErrImplCopyWithImpl<_$JsEvalResult_ErrImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JsValue field0) ok,
    required TResult Function(String field0) err,
  }) {
    return err(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JsValue field0)? ok,
    TResult? Function(String field0)? err,
  }) {
    return err?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JsValue field0)? ok,
    TResult Function(String field0)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsEvalResult_Ok value) ok,
    required TResult Function(JsEvalResult_Err value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsEvalResult_Ok value)? ok,
    TResult? Function(JsEvalResult_Err value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsEvalResult_Ok value)? ok,
    TResult Function(JsEvalResult_Err value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class JsEvalResult_Err extends JsEvalResult {
  const factory JsEvalResult_Err(final String field0) = _$JsEvalResult_ErrImpl;
  const JsEvalResult_Err._() : super._();

  @override
  String get field0;

  /// Create a copy of JsEvalResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsEvalResult_ErrImplCopyWith<_$JsEvalResult_ErrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JsModule {
  String get field0 => throw _privateConstructorUsedError;
  String get field1 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0, String field1) code,
    required TResult Function(String field0, String field1) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0, String field1)? code,
    TResult? Function(String field0, String field1)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0, String field1)? code,
    TResult Function(String field0, String field1)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsModule_Code value) code,
    required TResult Function(JsModule_Path value) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsModule_Code value)? code,
    TResult? Function(JsModule_Path value)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsModule_Code value)? code,
    TResult Function(JsModule_Path value)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JsModuleCopyWith<JsModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsModuleCopyWith<$Res> {
  factory $JsModuleCopyWith(JsModule value, $Res Function(JsModule) then) =
      _$JsModuleCopyWithImpl<$Res, JsModule>;
  @useResult
  $Res call({String field0, String field1});
}

/// @nodoc
class _$JsModuleCopyWithImpl<$Res, $Val extends JsModule>
    implements $JsModuleCopyWith<$Res> {
  _$JsModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
    Object? field1 = null,
  }) {
    return _then(_value.copyWith(
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
      field1: null == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JsModule_CodeImplCopyWith<$Res>
    implements $JsModuleCopyWith<$Res> {
  factory _$$JsModule_CodeImplCopyWith(
          _$JsModule_CodeImpl value, $Res Function(_$JsModule_CodeImpl) then) =
      __$$JsModule_CodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field0, String field1});
}

/// @nodoc
class __$$JsModule_CodeImplCopyWithImpl<$Res>
    extends _$JsModuleCopyWithImpl<$Res, _$JsModule_CodeImpl>
    implements _$$JsModule_CodeImplCopyWith<$Res> {
  __$$JsModule_CodeImplCopyWithImpl(
      _$JsModule_CodeImpl _value, $Res Function(_$JsModule_CodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
    Object? field1 = null,
  }) {
    return _then(_$JsModule_CodeImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
      null == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JsModule_CodeImpl extends JsModule_Code {
  const _$JsModule_CodeImpl(this.field0, this.field1) : super._();

  @override
  final String field0;
  @override
  final String field1;

  @override
  String toString() {
    return 'JsModule.code(field0: $field0, field1: $field1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsModule_CodeImpl &&
            (identical(other.field0, field0) || other.field0 == field0) &&
            (identical(other.field1, field1) || other.field1 == field1));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0, field1);

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsModule_CodeImplCopyWith<_$JsModule_CodeImpl> get copyWith =>
      __$$JsModule_CodeImplCopyWithImpl<_$JsModule_CodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0, String field1) code,
    required TResult Function(String field0, String field1) path,
  }) {
    return code(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0, String field1)? code,
    TResult? Function(String field0, String field1)? path,
  }) {
    return code?.call(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0, String field1)? code,
    TResult Function(String field0, String field1)? path,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(field0, field1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsModule_Code value) code,
    required TResult Function(JsModule_Path value) path,
  }) {
    return code(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsModule_Code value)? code,
    TResult? Function(JsModule_Path value)? path,
  }) {
    return code?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsModule_Code value)? code,
    TResult Function(JsModule_Path value)? path,
    required TResult orElse(),
  }) {
    if (code != null) {
      return code(this);
    }
    return orElse();
  }
}

abstract class JsModule_Code extends JsModule {
  const factory JsModule_Code(final String field0, final String field1) =
      _$JsModule_CodeImpl;
  const JsModule_Code._() : super._();

  @override
  String get field0;
  @override
  String get field1;

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsModule_CodeImplCopyWith<_$JsModule_CodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JsModule_PathImplCopyWith<$Res>
    implements $JsModuleCopyWith<$Res> {
  factory _$$JsModule_PathImplCopyWith(
          _$JsModule_PathImpl value, $Res Function(_$JsModule_PathImpl) then) =
      __$$JsModule_PathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field0, String field1});
}

/// @nodoc
class __$$JsModule_PathImplCopyWithImpl<$Res>
    extends _$JsModuleCopyWithImpl<$Res, _$JsModule_PathImpl>
    implements _$$JsModule_PathImplCopyWith<$Res> {
  __$$JsModule_PathImplCopyWithImpl(
      _$JsModule_PathImpl _value, $Res Function(_$JsModule_PathImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
    Object? field1 = null,
  }) {
    return _then(_$JsModule_PathImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
      null == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JsModule_PathImpl extends JsModule_Path {
  const _$JsModule_PathImpl(this.field0, this.field1) : super._();

  @override
  final String field0;
  @override
  final String field1;

  @override
  String toString() {
    return 'JsModule.path(field0: $field0, field1: $field1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsModule_PathImpl &&
            (identical(other.field0, field0) || other.field0 == field0) &&
            (identical(other.field1, field1) || other.field1 == field1));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0, field1);

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsModule_PathImplCopyWith<_$JsModule_PathImpl> get copyWith =>
      __$$JsModule_PathImplCopyWithImpl<_$JsModule_PathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0, String field1) code,
    required TResult Function(String field0, String field1) path,
  }) {
    return path(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0, String field1)? code,
    TResult? Function(String field0, String field1)? path,
  }) {
    return path?.call(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0, String field1)? code,
    TResult Function(String field0, String field1)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(field0, field1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JsModule_Code value) code,
    required TResult Function(JsModule_Path value) path,
  }) {
    return path(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JsModule_Code value)? code,
    TResult? Function(JsModule_Path value)? path,
  }) {
    return path?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JsModule_Code value)? code,
    TResult Function(JsModule_Path value)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(this);
    }
    return orElse();
  }
}

abstract class JsModule_Path extends JsModule {
  const factory JsModule_Path(final String field0, final String field1) =
      _$JsModule_PathImpl;
  const JsModule_Path._() : super._();

  @override
  String get field0;
  @override
  String get field1;

  /// Create a copy of JsModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsModule_PathImplCopyWith<_$JsModule_PathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
