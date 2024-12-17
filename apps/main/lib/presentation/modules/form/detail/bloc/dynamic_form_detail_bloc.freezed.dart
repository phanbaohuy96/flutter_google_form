// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dynamic_form_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewModel {
  DynamicForm? get data => throw _privateConstructorUsedError;
  List<DynamicFormResponse> get responses => throw _privateConstructorUsedError;
  Map<String?, DynamicFormResponse> get composingResponses =>
      throw _privateConstructorUsedError;

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$ViewModelCopyWith<_ViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ViewModelCopyWith<$Res> {
  factory _$ViewModelCopyWith(
          _ViewModel value, $Res Function(_ViewModel) then) =
      __$ViewModelCopyWithImpl<$Res, _ViewModel>;
  @useResult
  $Res call(
      {DynamicForm? data,
      List<DynamicFormResponse> responses,
      Map<String?, DynamicFormResponse> composingResponses});

  $DynamicFormCopyWith<$Res>? get data;
}

/// @nodoc
class __$ViewModelCopyWithImpl<$Res, $Val extends _ViewModel>
    implements _$ViewModelCopyWith<$Res> {
  __$ViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? responses = null,
    Object? composingResponses = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DynamicForm?,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormResponse>,
      composingResponses: null == composingResponses
          ? _value.composingResponses
          : composingResponses // ignore: cast_nullable_to_non_nullable
              as Map<String?, DynamicFormResponse>,
    ) as $Val);
  }

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DynamicFormCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DynamicFormCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewModelImplCopyWith<$Res>
    implements _$ViewModelCopyWith<$Res> {
  factory _$$_ViewModelImplCopyWith(
          _$_ViewModelImpl value, $Res Function(_$_ViewModelImpl) then) =
      __$$_ViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DynamicForm? data,
      List<DynamicFormResponse> responses,
      Map<String?, DynamicFormResponse> composingResponses});

  @override
  $DynamicFormCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ViewModelImplCopyWithImpl<$Res>
    extends __$ViewModelCopyWithImpl<$Res, _$_ViewModelImpl>
    implements _$$_ViewModelImplCopyWith<$Res> {
  __$$_ViewModelImplCopyWithImpl(
      _$_ViewModelImpl _value, $Res Function(_$_ViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? responses = null,
    Object? composingResponses = null,
  }) {
    return _then(_$_ViewModelImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DynamicForm?,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormResponse>,
      composingResponses: null == composingResponses
          ? _value._composingResponses
          : composingResponses // ignore: cast_nullable_to_non_nullable
              as Map<String?, DynamicFormResponse>,
    ));
  }
}

/// @nodoc

class _$_ViewModelImpl implements __ViewModel {
  const _$_ViewModelImpl(
      {this.data,
      final List<DynamicFormResponse> responses = const [],
      final Map<String?, DynamicFormResponse> composingResponses = const {}})
      : _responses = responses,
        _composingResponses = composingResponses;

  @override
  final DynamicForm? data;
  final List<DynamicFormResponse> _responses;
  @override
  @JsonKey()
  List<DynamicFormResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  final Map<String?, DynamicFormResponse> _composingResponses;
  @override
  @JsonKey()
  Map<String?, DynamicFormResponse> get composingResponses {
    if (_composingResponses is EqualUnmodifiableMapView)
      return _composingResponses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_composingResponses);
  }

  @override
  String toString() {
    return '_ViewModel(data: $data, responses: $responses, composingResponses: $composingResponses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModelImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            const DeepCollectionEquality()
                .equals(other._composingResponses, _composingResponses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      data,
      const DeepCollectionEquality().hash(_responses),
      const DeepCollectionEquality().hash(_composingResponses));

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModelImplCopyWith<_$_ViewModelImpl> get copyWith =>
      __$$_ViewModelImplCopyWithImpl<_$_ViewModelImpl>(this, _$identity);
}

abstract class __ViewModel implements _ViewModel {
  const factory __ViewModel(
          {final DynamicForm? data,
          final List<DynamicFormResponse> responses,
          final Map<String?, DynamicFormResponse> composingResponses}) =
      _$_ViewModelImpl;

  @override
  DynamicForm? get data;
  @override
  List<DynamicFormResponse> get responses;
  @override
  Map<String?, DynamicFormResponse> get composingResponses;

  /// Create a copy of _ViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$_ViewModelImplCopyWith<_$_ViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
