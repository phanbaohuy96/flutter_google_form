// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dynamic_form_filter.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DynamicFormFilter {
  String? get id => throw _privateConstructorUsedError;
  DateRange? get timeRange => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormFilterCopyWith<DynamicFormFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormFilterCopyWith<$Res> {
  factory $DynamicFormFilterCopyWith(
          DynamicFormFilter value, $Res Function(DynamicFormFilter) then) =
      _$DynamicFormFilterCopyWithImpl<$Res, DynamicFormFilter>;
  @useResult
  $Res call({String? id, DateRange? timeRange});
}

/// @nodoc
class _$DynamicFormFilterCopyWithImpl<$Res, $Val extends DynamicFormFilter>
    implements $DynamicFormFilterCopyWith<$Res> {
  _$DynamicFormFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeRange = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormFilterImplCopyWith<$Res>
    implements $DynamicFormFilterCopyWith<$Res> {
  factory _$$DynamicFormFilterImplCopyWith(_$DynamicFormFilterImpl value,
          $Res Function(_$DynamicFormFilterImpl) then) =
      __$$DynamicFormFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, DateRange? timeRange});
}

/// @nodoc
class __$$DynamicFormFilterImplCopyWithImpl<$Res>
    extends _$DynamicFormFilterCopyWithImpl<$Res, _$DynamicFormFilterImpl>
    implements _$$DynamicFormFilterImplCopyWith<$Res> {
  __$$DynamicFormFilterImplCopyWithImpl(_$DynamicFormFilterImpl _value,
      $Res Function(_$DynamicFormFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicFormFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeRange = freezed,
  }) {
    return _then(_$DynamicFormFilterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
    ));
  }
}

/// @nodoc

class _$DynamicFormFilterImpl extends _DynamicFormFilter {
  const _$DynamicFormFilterImpl({this.id, this.timeRange}) : super._();

  @override
  final String? id;
  @override
  final DateRange? timeRange;

  @override
  String toString() {
    return 'DynamicFormFilter(id: $id, timeRange: $timeRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormFilterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, timeRange);

  /// Create a copy of DynamicFormFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormFilterImplCopyWith<_$DynamicFormFilterImpl> get copyWith =>
      __$$DynamicFormFilterImplCopyWithImpl<_$DynamicFormFilterImpl>(
          this, _$identity);
}

abstract class _DynamicFormFilter extends DynamicFormFilter {
  const factory _DynamicFormFilter(
      {final String? id, final DateRange? timeRange}) = _$DynamicFormFilterImpl;
  const _DynamicFormFilter._() : super._();

  @override
  String? get id;
  @override
  DateRange? get timeRange;

  /// Create a copy of DynamicFormFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormFilterImplCopyWith<_$DynamicFormFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DynamicFormResponseFilter {
  String? get elementId => throw _privateConstructorUsedError;
  String? get formId => throw _privateConstructorUsedError;
  String? get optionId => throw _privateConstructorUsedError;
  DateRange? get timeRange => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormResponseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormResponseFilterCopyWith<DynamicFormResponseFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormResponseFilterCopyWith<$Res> {
  factory $DynamicFormResponseFilterCopyWith(DynamicFormResponseFilter value,
          $Res Function(DynamicFormResponseFilter) then) =
      _$DynamicFormResponseFilterCopyWithImpl<$Res, DynamicFormResponseFilter>;
  @useResult
  $Res call(
      {String? elementId,
      String? formId,
      String? optionId,
      DateRange? timeRange});
}

/// @nodoc
class _$DynamicFormResponseFilterCopyWithImpl<$Res,
        $Val extends DynamicFormResponseFilter>
    implements $DynamicFormResponseFilterCopyWith<$Res> {
  _$DynamicFormResponseFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormResponseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementId = freezed,
    Object? formId = freezed,
    Object? optionId = freezed,
    Object? timeRange = freezed,
  }) {
    return _then(_value.copyWith(
      elementId: freezed == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String?,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormResponseFilterImplCopyWith<$Res>
    implements $DynamicFormResponseFilterCopyWith<$Res> {
  factory _$$DynamicFormResponseFilterImplCopyWith(
          _$DynamicFormResponseFilterImpl value,
          $Res Function(_$DynamicFormResponseFilterImpl) then) =
      __$$DynamicFormResponseFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? elementId,
      String? formId,
      String? optionId,
      DateRange? timeRange});
}

/// @nodoc
class __$$DynamicFormResponseFilterImplCopyWithImpl<$Res>
    extends _$DynamicFormResponseFilterCopyWithImpl<$Res,
        _$DynamicFormResponseFilterImpl>
    implements _$$DynamicFormResponseFilterImplCopyWith<$Res> {
  __$$DynamicFormResponseFilterImplCopyWithImpl(
      _$DynamicFormResponseFilterImpl _value,
      $Res Function(_$DynamicFormResponseFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicFormResponseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elementId = freezed,
    Object? formId = freezed,
    Object? optionId = freezed,
    Object? timeRange = freezed,
  }) {
    return _then(_$DynamicFormResponseFilterImpl(
      elementId: freezed == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String?,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
    ));
  }
}

/// @nodoc

class _$DynamicFormResponseFilterImpl extends _DynamicFormResponseFilter {
  const _$DynamicFormResponseFilterImpl(
      {this.elementId, this.formId, this.optionId, this.timeRange})
      : super._();

  @override
  final String? elementId;
  @override
  final String? formId;
  @override
  final String? optionId;
  @override
  final DateRange? timeRange;

  @override
  String toString() {
    return 'DynamicFormResponseFilter(elementId: $elementId, formId: $formId, optionId: $optionId, timeRange: $timeRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormResponseFilterImpl &&
            (identical(other.elementId, elementId) ||
                other.elementId == elementId) &&
            (identical(other.formId, formId) || other.formId == formId) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, elementId, formId, optionId, timeRange);

  /// Create a copy of DynamicFormResponseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormResponseFilterImplCopyWith<_$DynamicFormResponseFilterImpl>
      get copyWith => __$$DynamicFormResponseFilterImplCopyWithImpl<
          _$DynamicFormResponseFilterImpl>(this, _$identity);
}

abstract class _DynamicFormResponseFilter extends DynamicFormResponseFilter {
  const factory _DynamicFormResponseFilter(
      {final String? elementId,
      final String? formId,
      final String? optionId,
      final DateRange? timeRange}) = _$DynamicFormResponseFilterImpl;
  const _DynamicFormResponseFilter._() : super._();

  @override
  String? get elementId;
  @override
  String? get formId;
  @override
  String? get optionId;
  @override
  DateRange? get timeRange;

  /// Create a copy of DynamicFormResponseFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormResponseFilterImplCopyWith<_$DynamicFormResponseFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
