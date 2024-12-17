// ignore_for_file: invalid_annotation_target

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'form.freezed.dart';
part 'form.g.dart';

@JsonEnum(valueField: 'id')
enum DynamicFormElementType {
  radio('radio'),
  paragraph('paragraph'),
  ;

  const DynamicFormElementType(this.id);
  final String id;
}

@freezed
class DynamicForm with _$DynamicForm {
  @JsonSerializable(explicitToJson: true)
  const factory DynamicForm({
    @JsonKey(name: 'id', fromJson: asOrNull) final String? id,
    @JsonKey(name: 'elements') final List<DynamicFormElement>? elements,
    @JsonKey(name: 'created_user') final User? createdUser,
    @JsonKey(name: 'created_at', fromJson: asOrNull) final DateTime? createdAt,
  }) = _DynamicForm;

  const DynamicForm._();

  factory DynamicForm.fromJson(Map<String, Object?> json) =>
      _$DynamicFormFromJson(json);

  @override
  bool operator ==(covariant DynamicForm other) {
    if (identical(this, other)) {
      return true;
    }
    return other.id == id;
  }
}

@freezed
class DynamicFormElement with _$DynamicFormElement {
  @JsonSerializable(explicitToJson: true)
  const factory DynamicFormElement({
    @JsonKey(name: 'id', fromJson: asOrNull) final String? id,
    @JsonKey(name: 'title', fromJson: asOrNull) final String? title,
    @JsonKey(name: 'type') final DynamicFormElementType? type,
    @JsonKey(name: 'metadata') final List<DynamicFormElementMetadata>? metadata,
    @JsonKey(name: 'required', fromJson: asOrNull) final bool? required,
  }) = _DynamicFormElement;

  const DynamicFormElement._();

  factory DynamicFormElement.fromJson(Map<String, Object?> json) =>
      _$DynamicFormElementFromJson(json);

  @override
  bool operator ==(covariant DynamicFormElement other) {
    if (identical(this, other)) {
      return true;
    }
    return other.id == id;
  }
}

@freezed
class DynamicFormElementMetadata with _$DynamicFormElementMetadata {
  @JsonSerializable(explicitToJson: true)
  const factory DynamicFormElementMetadata({
    @JsonKey(name: 'id', fromJson: asOrNull) final String? id,
    @JsonKey(name: 'lable', fromJson: asOrNull) final String? lable,
    @JsonKey(name: 'is_default', fromJson: asOrNull) final bool? idDefault,
    @JsonKey(name: 'is_other', fromJson: asOrNull) final bool? isOther,
  }) = _DynamicFormElementMetadata;

  const DynamicFormElementMetadata._();

  factory DynamicFormElementMetadata.fromJson(Map<String, Object?> json) =>
      _$DynamicFormElementMetadataFromJson(json);

  @override
  bool operator ==(covariant DynamicFormElementMetadata other) {
    if (identical(this, other)) {
      return true;
    }
    return other.id == id;
  }
}
