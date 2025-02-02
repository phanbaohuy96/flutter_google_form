// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DynamicForm _$DynamicFormFromJson(Map<String, dynamic> json) {
  return _DynamicForm.fromJson(json);
}

/// @nodoc
mixin _$DynamicForm {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', fromJson: asOrNull)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'elements')
  List<DynamicFormElement>? get elements => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_user')
  User? get createdUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DynamicForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormCopyWith<DynamicForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormCopyWith<$Res> {
  factory $DynamicFormCopyWith(
          DynamicForm value, $Res Function(DynamicForm) then) =
      _$DynamicFormCopyWithImpl<$Res, DynamicForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) String? title,
      @JsonKey(name: 'elements') List<DynamicFormElement>? elements,
      @JsonKey(name: 'created_user') User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) DateTime? createdAt});
}

/// @nodoc
class _$DynamicFormCopyWithImpl<$Res, $Val extends DynamicForm>
    implements $DynamicFormCopyWith<$Res> {
  _$DynamicFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? elements = freezed,
    Object? createdUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      elements: freezed == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormElement>?,
      createdUser: freezed == createdUser
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormImplCopyWith<$Res>
    implements $DynamicFormCopyWith<$Res> {
  factory _$$DynamicFormImplCopyWith(
          _$DynamicFormImpl value, $Res Function(_$DynamicFormImpl) then) =
      __$$DynamicFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) String? title,
      @JsonKey(name: 'elements') List<DynamicFormElement>? elements,
      @JsonKey(name: 'created_user') User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) DateTime? createdAt});
}

/// @nodoc
class __$$DynamicFormImplCopyWithImpl<$Res>
    extends _$DynamicFormCopyWithImpl<$Res, _$DynamicFormImpl>
    implements _$$DynamicFormImplCopyWith<$Res> {
  __$$DynamicFormImplCopyWithImpl(
      _$DynamicFormImpl _value, $Res Function(_$DynamicFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? elements = freezed,
    Object? createdUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DynamicFormImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      elements: freezed == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormElement>?,
      createdUser: freezed == createdUser
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DynamicFormImpl extends _DynamicForm {
  const _$DynamicFormImpl(
      {@JsonKey(name: 'id', fromJson: asOrNull) this.id,
      @JsonKey(name: 'title', fromJson: asOrNull) this.title,
      @JsonKey(name: 'elements') final List<DynamicFormElement>? elements,
      @JsonKey(name: 'created_user') this.createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) this.createdAt})
      : _elements = elements,
        super._();

  factory _$DynamicFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  final String? id;
  @override
  @JsonKey(name: 'title', fromJson: asOrNull)
  final String? title;
  final List<DynamicFormElement>? _elements;
  @override
  @JsonKey(name: 'elements')
  List<DynamicFormElement>? get elements {
    final value = _elements;
    if (value == null) return null;
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_user')
  final User? createdUser;
  @override
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DynamicForm(id: $id, title: $title, elements: $elements, createdUser: $createdUser, createdAt: $createdAt)';
  }

  /// Create a copy of DynamicForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormImplCopyWith<_$DynamicFormImpl> get copyWith =>
      __$$DynamicFormImplCopyWithImpl<_$DynamicFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormImplToJson(
      this,
    );
  }
}

abstract class _DynamicForm extends DynamicForm {
  const factory _DynamicForm(
      {@JsonKey(name: 'id', fromJson: asOrNull) final String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) final String? title,
      @JsonKey(name: 'elements') final List<DynamicFormElement>? elements,
      @JsonKey(name: 'created_user') final User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull)
      final DateTime? createdAt}) = _$DynamicFormImpl;
  const _DynamicForm._() : super._();

  factory _DynamicForm.fromJson(Map<String, dynamic> json) =
      _$DynamicFormImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id;
  @override
  @JsonKey(name: 'title', fromJson: asOrNull)
  String? get title;
  @override
  @JsonKey(name: 'elements')
  List<DynamicFormElement>? get elements;
  @override
  @JsonKey(name: 'created_user')
  User? get createdUser;
  @override
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  DateTime? get createdAt;

  /// Create a copy of DynamicForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormImplCopyWith<_$DynamicFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DynamicFormElement _$DynamicFormElementFromJson(Map<String, dynamic> json) {
  return _DynamicFormElement.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormElement {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', fromJson: asOrNull)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  DynamicFormElementType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  List<DynamicFormElementMetadata>? get metadata =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'required', fromJson: asOrNull)
  bool? get required => throw _privateConstructorUsedError;

  /// Serializes this DynamicFormElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormElementCopyWith<DynamicFormElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormElementCopyWith<$Res> {
  factory $DynamicFormElementCopyWith(
          DynamicFormElement value, $Res Function(DynamicFormElement) then) =
      _$DynamicFormElementCopyWithImpl<$Res, DynamicFormElement>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) String? title,
      @JsonKey(name: 'type') DynamicFormElementType? type,
      @JsonKey(name: 'metadata') List<DynamicFormElementMetadata>? metadata,
      @JsonKey(name: 'required', fromJson: asOrNull) bool? required});
}

/// @nodoc
class _$DynamicFormElementCopyWithImpl<$Res, $Val extends DynamicFormElement>
    implements $DynamicFormElementCopyWith<$Res> {
  _$DynamicFormElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? metadata = freezed,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DynamicFormElementType?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormElementMetadata>?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormElementImplCopyWith<$Res>
    implements $DynamicFormElementCopyWith<$Res> {
  factory _$$DynamicFormElementImplCopyWith(_$DynamicFormElementImpl value,
          $Res Function(_$DynamicFormElementImpl) then) =
      __$$DynamicFormElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) String? title,
      @JsonKey(name: 'type') DynamicFormElementType? type,
      @JsonKey(name: 'metadata') List<DynamicFormElementMetadata>? metadata,
      @JsonKey(name: 'required', fromJson: asOrNull) bool? required});
}

/// @nodoc
class __$$DynamicFormElementImplCopyWithImpl<$Res>
    extends _$DynamicFormElementCopyWithImpl<$Res, _$DynamicFormElementImpl>
    implements _$$DynamicFormElementImplCopyWith<$Res> {
  __$$DynamicFormElementImplCopyWithImpl(_$DynamicFormElementImpl _value,
      $Res Function(_$DynamicFormElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicFormElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? metadata = freezed,
    Object? required = freezed,
  }) {
    return _then(_$DynamicFormElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DynamicFormElementType?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<DynamicFormElementMetadata>?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DynamicFormElementImpl extends _DynamicFormElement {
  const _$DynamicFormElementImpl(
      {@JsonKey(name: 'id', fromJson: asOrNull) this.id,
      @JsonKey(name: 'title', fromJson: asOrNull) this.title,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'metadata')
      final List<DynamicFormElementMetadata>? metadata,
      @JsonKey(name: 'required', fromJson: asOrNull) this.required})
      : _metadata = metadata,
        super._();

  factory _$DynamicFormElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormElementImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  final String? id;
  @override
  @JsonKey(name: 'title', fromJson: asOrNull)
  final String? title;
  @override
  @JsonKey(name: 'type')
  final DynamicFormElementType? type;
  final List<DynamicFormElementMetadata>? _metadata;
  @override
  @JsonKey(name: 'metadata')
  List<DynamicFormElementMetadata>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableListView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'required', fromJson: asOrNull)
  final bool? required;

  @override
  String toString() {
    return 'DynamicFormElement(id: $id, title: $title, type: $type, metadata: $metadata, required: $required)';
  }

  /// Create a copy of DynamicFormElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormElementImplCopyWith<_$DynamicFormElementImpl> get copyWith =>
      __$$DynamicFormElementImplCopyWithImpl<_$DynamicFormElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormElementImplToJson(
      this,
    );
  }
}

abstract class _DynamicFormElement extends DynamicFormElement {
  const factory _DynamicFormElement(
      {@JsonKey(name: 'id', fromJson: asOrNull) final String? id,
      @JsonKey(name: 'title', fromJson: asOrNull) final String? title,
      @JsonKey(name: 'type') final DynamicFormElementType? type,
      @JsonKey(name: 'metadata')
      final List<DynamicFormElementMetadata>? metadata,
      @JsonKey(name: 'required', fromJson: asOrNull)
      final bool? required}) = _$DynamicFormElementImpl;
  const _DynamicFormElement._() : super._();

  factory _DynamicFormElement.fromJson(Map<String, dynamic> json) =
      _$DynamicFormElementImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id;
  @override
  @JsonKey(name: 'title', fromJson: asOrNull)
  String? get title;
  @override
  @JsonKey(name: 'type')
  DynamicFormElementType? get type;
  @override
  @JsonKey(name: 'metadata')
  List<DynamicFormElementMetadata>? get metadata;
  @override
  @JsonKey(name: 'required', fromJson: asOrNull)
  bool? get required;

  /// Create a copy of DynamicFormElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormElementImplCopyWith<_$DynamicFormElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DynamicFormElementMetadata _$DynamicFormElementMetadataFromJson(
    Map<String, dynamic> json) {
  return _DynamicFormElementMetadata.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormElementMetadata {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lable', fromJson: asOrNull)
  String? get lable => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default', fromJson: asOrNull)
  bool? get idDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_other', fromJson: asOrNull)
  bool? get isOther => throw _privateConstructorUsedError;

  /// Serializes this DynamicFormElementMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormElementMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormElementMetadataCopyWith<DynamicFormElementMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormElementMetadataCopyWith<$Res> {
  factory $DynamicFormElementMetadataCopyWith(DynamicFormElementMetadata value,
          $Res Function(DynamicFormElementMetadata) then) =
      _$DynamicFormElementMetadataCopyWithImpl<$Res,
          DynamicFormElementMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'lable', fromJson: asOrNull) String? lable,
      @JsonKey(name: 'is_default', fromJson: asOrNull) bool? idDefault,
      @JsonKey(name: 'is_other', fromJson: asOrNull) bool? isOther});
}

/// @nodoc
class _$DynamicFormElementMetadataCopyWithImpl<$Res,
        $Val extends DynamicFormElementMetadata>
    implements $DynamicFormElementMetadataCopyWith<$Res> {
  _$DynamicFormElementMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormElementMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lable = freezed,
    Object? idDefault = freezed,
    Object? isOther = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lable: freezed == lable
          ? _value.lable
          : lable // ignore: cast_nullable_to_non_nullable
              as String?,
      idDefault: freezed == idDefault
          ? _value.idDefault
          : idDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOther: freezed == isOther
          ? _value.isOther
          : isOther // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynamicFormElementMetadataImplCopyWith<$Res>
    implements $DynamicFormElementMetadataCopyWith<$Res> {
  factory _$$DynamicFormElementMetadataImplCopyWith(
          _$DynamicFormElementMetadataImpl value,
          $Res Function(_$DynamicFormElementMetadataImpl) then) =
      __$$DynamicFormElementMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'lable', fromJson: asOrNull) String? lable,
      @JsonKey(name: 'is_default', fromJson: asOrNull) bool? idDefault,
      @JsonKey(name: 'is_other', fromJson: asOrNull) bool? isOther});
}

/// @nodoc
class __$$DynamicFormElementMetadataImplCopyWithImpl<$Res>
    extends _$DynamicFormElementMetadataCopyWithImpl<$Res,
        _$DynamicFormElementMetadataImpl>
    implements _$$DynamicFormElementMetadataImplCopyWith<$Res> {
  __$$DynamicFormElementMetadataImplCopyWithImpl(
      _$DynamicFormElementMetadataImpl _value,
      $Res Function(_$DynamicFormElementMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicFormElementMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lable = freezed,
    Object? idDefault = freezed,
    Object? isOther = freezed,
  }) {
    return _then(_$DynamicFormElementMetadataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lable: freezed == lable
          ? _value.lable
          : lable // ignore: cast_nullable_to_non_nullable
              as String?,
      idDefault: freezed == idDefault
          ? _value.idDefault
          : idDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOther: freezed == isOther
          ? _value.isOther
          : isOther // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DynamicFormElementMetadataImpl extends _DynamicFormElementMetadata {
  const _$DynamicFormElementMetadataImpl(
      {@JsonKey(name: 'id', fromJson: asOrNull) this.id,
      @JsonKey(name: 'lable', fromJson: asOrNull) this.lable,
      @JsonKey(name: 'is_default', fromJson: asOrNull) this.idDefault,
      @JsonKey(name: 'is_other', fromJson: asOrNull) this.isOther})
      : super._();

  factory _$DynamicFormElementMetadataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DynamicFormElementMetadataImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  final String? id;
  @override
  @JsonKey(name: 'lable', fromJson: asOrNull)
  final String? lable;
  @override
  @JsonKey(name: 'is_default', fromJson: asOrNull)
  final bool? idDefault;
  @override
  @JsonKey(name: 'is_other', fromJson: asOrNull)
  final bool? isOther;

  @override
  String toString() {
    return 'DynamicFormElementMetadata(id: $id, lable: $lable, idDefault: $idDefault, isOther: $isOther)';
  }

  /// Create a copy of DynamicFormElementMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormElementMetadataImplCopyWith<_$DynamicFormElementMetadataImpl>
      get copyWith => __$$DynamicFormElementMetadataImplCopyWithImpl<
          _$DynamicFormElementMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormElementMetadataImplToJson(
      this,
    );
  }
}

abstract class _DynamicFormElementMetadata extends DynamicFormElementMetadata {
  const factory _DynamicFormElementMetadata(
      {@JsonKey(name: 'id', fromJson: asOrNull) final String? id,
      @JsonKey(name: 'lable', fromJson: asOrNull) final String? lable,
      @JsonKey(name: 'is_default', fromJson: asOrNull) final bool? idDefault,
      @JsonKey(name: 'is_other', fromJson: asOrNull)
      final bool? isOther}) = _$DynamicFormElementMetadataImpl;
  const _DynamicFormElementMetadata._() : super._();

  factory _DynamicFormElementMetadata.fromJson(Map<String, dynamic> json) =
      _$DynamicFormElementMetadataImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id;
  @override
  @JsonKey(name: 'lable', fromJson: asOrNull)
  String? get lable;
  @override
  @JsonKey(name: 'is_default', fromJson: asOrNull)
  bool? get idDefault;
  @override
  @JsonKey(name: 'is_other', fromJson: asOrNull)
  bool? get isOther;

  /// Create a copy of DynamicFormElementMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormElementMetadataImplCopyWith<_$DynamicFormElementMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DynamicFormResponse _$DynamicFormResponseFromJson(Map<String, dynamic> json) {
  return _DynamicFormResponse.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormResponse {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'element_id', fromJson: asOrNull)
  String? get elementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'element')
  DynamicFormElement? get element => throw _privateConstructorUsedError;
  @JsonKey(name: 'form_id', fromJson: asOrNull)
  String? get formId => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_id', fromJson: asOrNull)
  String? get optionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'option')
  DynamicFormElementMetadata? get option => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer', fromJson: asOrNull)
  String? get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_user')
  User? get createdUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DynamicFormResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormResponseCopyWith<DynamicFormResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormResponseCopyWith<$Res> {
  factory $DynamicFormResponseCopyWith(
          DynamicFormResponse value, $Res Function(DynamicFormResponse) then) =
      _$DynamicFormResponseCopyWithImpl<$Res, DynamicFormResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'element_id', fromJson: asOrNull) String? elementId,
      @JsonKey(name: 'element') DynamicFormElement? element,
      @JsonKey(name: 'form_id', fromJson: asOrNull) String? formId,
      @JsonKey(name: 'option_id', fromJson: asOrNull) String? optionId,
      @JsonKey(name: 'option') DynamicFormElementMetadata? option,
      @JsonKey(name: 'answer', fromJson: asOrNull) String? answer,
      @JsonKey(name: 'created_user') User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) DateTime? createdAt});

  $DynamicFormElementCopyWith<$Res>? get element;
  $DynamicFormElementMetadataCopyWith<$Res>? get option;
}

/// @nodoc
class _$DynamicFormResponseCopyWithImpl<$Res, $Val extends DynamicFormResponse>
    implements $DynamicFormResponseCopyWith<$Res> {
  _$DynamicFormResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? elementId = freezed,
    Object? element = freezed,
    Object? formId = freezed,
    Object? optionId = freezed,
    Object? option = freezed,
    Object? answer = freezed,
    Object? createdUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      elementId: freezed == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as DynamicFormElement?,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String?,
      option: freezed == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as DynamicFormElementMetadata?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdUser: freezed == createdUser
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DynamicFormElementCopyWith<$Res>? get element {
    if (_value.element == null) {
      return null;
    }

    return $DynamicFormElementCopyWith<$Res>(_value.element!, (value) {
      return _then(_value.copyWith(element: value) as $Val);
    });
  }

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DynamicFormElementMetadataCopyWith<$Res>? get option {
    if (_value.option == null) {
      return null;
    }

    return $DynamicFormElementMetadataCopyWith<$Res>(_value.option!, (value) {
      return _then(_value.copyWith(option: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DynamicFormResponseImplCopyWith<$Res>
    implements $DynamicFormResponseCopyWith<$Res> {
  factory _$$DynamicFormResponseImplCopyWith(_$DynamicFormResponseImpl value,
          $Res Function(_$DynamicFormResponseImpl) then) =
      __$$DynamicFormResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', fromJson: asOrNull) String? id,
      @JsonKey(name: 'element_id', fromJson: asOrNull) String? elementId,
      @JsonKey(name: 'element') DynamicFormElement? element,
      @JsonKey(name: 'form_id', fromJson: asOrNull) String? formId,
      @JsonKey(name: 'option_id', fromJson: asOrNull) String? optionId,
      @JsonKey(name: 'option') DynamicFormElementMetadata? option,
      @JsonKey(name: 'answer', fromJson: asOrNull) String? answer,
      @JsonKey(name: 'created_user') User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) DateTime? createdAt});

  @override
  $DynamicFormElementCopyWith<$Res>? get element;
  @override
  $DynamicFormElementMetadataCopyWith<$Res>? get option;
}

/// @nodoc
class __$$DynamicFormResponseImplCopyWithImpl<$Res>
    extends _$DynamicFormResponseCopyWithImpl<$Res, _$DynamicFormResponseImpl>
    implements _$$DynamicFormResponseImplCopyWith<$Res> {
  __$$DynamicFormResponseImplCopyWithImpl(_$DynamicFormResponseImpl _value,
      $Res Function(_$DynamicFormResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? elementId = freezed,
    Object? element = freezed,
    Object? formId = freezed,
    Object? optionId = freezed,
    Object? option = freezed,
    Object? answer = freezed,
    Object? createdUser = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DynamicFormResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      elementId: freezed == elementId
          ? _value.elementId
          : elementId // ignore: cast_nullable_to_non_nullable
              as String?,
      element: freezed == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as DynamicFormElement?,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String?,
      option: freezed == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as DynamicFormElementMetadata?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      createdUser: freezed == createdUser
          ? _value.createdUser
          : createdUser // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DynamicFormResponseImpl extends _DynamicFormResponse {
  const _$DynamicFormResponseImpl(
      {@JsonKey(name: 'id', fromJson: asOrNull) this.id,
      @JsonKey(name: 'element_id', fromJson: asOrNull) this.elementId,
      @JsonKey(name: 'element') this.element,
      @JsonKey(name: 'form_id', fromJson: asOrNull) this.formId,
      @JsonKey(name: 'option_id', fromJson: asOrNull) this.optionId,
      @JsonKey(name: 'option') this.option,
      @JsonKey(name: 'answer', fromJson: asOrNull) this.answer,
      @JsonKey(name: 'created_user') this.createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull) this.createdAt})
      : super._();

  factory _$DynamicFormResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  final String? id;
  @override
  @JsonKey(name: 'element_id', fromJson: asOrNull)
  final String? elementId;
  @override
  @JsonKey(name: 'element')
  final DynamicFormElement? element;
  @override
  @JsonKey(name: 'form_id', fromJson: asOrNull)
  final String? formId;
  @override
  @JsonKey(name: 'option_id', fromJson: asOrNull)
  final String? optionId;
  @override
  @JsonKey(name: 'option')
  final DynamicFormElementMetadata? option;
  @override
  @JsonKey(name: 'answer', fromJson: asOrNull)
  final String? answer;
  @override
  @JsonKey(name: 'created_user')
  final User? createdUser;
  @override
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DynamicFormResponse(id: $id, elementId: $elementId, element: $element, formId: $formId, optionId: $optionId, option: $option, answer: $answer, createdUser: $createdUser, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.elementId, elementId) ||
                other.elementId == elementId) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.formId, formId) || other.formId == formId) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.createdUser, createdUser) ||
                other.createdUser == createdUser) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, elementId, element, formId,
      optionId, option, answer, createdUser, createdAt);

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormResponseImplCopyWith<_$DynamicFormResponseImpl> get copyWith =>
      __$$DynamicFormResponseImplCopyWithImpl<_$DynamicFormResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormResponseImplToJson(
      this,
    );
  }
}

abstract class _DynamicFormResponse extends DynamicFormResponse {
  const factory _DynamicFormResponse(
      {@JsonKey(name: 'id', fromJson: asOrNull) final String? id,
      @JsonKey(name: 'element_id', fromJson: asOrNull) final String? elementId,
      @JsonKey(name: 'element') final DynamicFormElement? element,
      @JsonKey(name: 'form_id', fromJson: asOrNull) final String? formId,
      @JsonKey(name: 'option_id', fromJson: asOrNull) final String? optionId,
      @JsonKey(name: 'option') final DynamicFormElementMetadata? option,
      @JsonKey(name: 'answer', fromJson: asOrNull) final String? answer,
      @JsonKey(name: 'created_user') final User? createdUser,
      @JsonKey(name: 'created_at', fromJson: asOrNull)
      final DateTime? createdAt}) = _$DynamicFormResponseImpl;
  const _DynamicFormResponse._() : super._();

  factory _DynamicFormResponse.fromJson(Map<String, dynamic> json) =
      _$DynamicFormResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? get id;
  @override
  @JsonKey(name: 'element_id', fromJson: asOrNull)
  String? get elementId;
  @override
  @JsonKey(name: 'element')
  DynamicFormElement? get element;
  @override
  @JsonKey(name: 'form_id', fromJson: asOrNull)
  String? get formId;
  @override
  @JsonKey(name: 'option_id', fromJson: asOrNull)
  String? get optionId;
  @override
  @JsonKey(name: 'option')
  DynamicFormElementMetadata? get option;
  @override
  @JsonKey(name: 'answer', fromJson: asOrNull)
  String? get answer;
  @override
  @JsonKey(name: 'created_user')
  User? get createdUser;
  @override
  @JsonKey(name: 'created_at', fromJson: asOrNull)
  DateTime? get createdAt;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormResponseImplCopyWith<_$DynamicFormResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
