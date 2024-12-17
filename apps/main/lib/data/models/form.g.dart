// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicFormImpl _$$DynamicFormImplFromJson(Map<String, dynamic> json) =>
    _$DynamicFormImpl(
      id: asOrNull(json['id']),
      title: asOrNull(json['title']),
      elements: (json['elements'] as List<dynamic>?)
          ?.map((e) => DynamicFormElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdUser: json['created_user'] == null
          ? null
          : User.fromJson(json['created_user'] as Map<String, dynamic>),
      createdAt: asOrNull(json['created_at']),
    );

Map<String, dynamic> _$$DynamicFormImplToJson(_$DynamicFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'elements': instance.elements?.map((e) => e.toJson()).toList(),
      'created_user': instance.createdUser?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$DynamicFormElementImpl _$$DynamicFormElementImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicFormElementImpl(
      id: asOrNull(json['id']),
      title: asOrNull(json['title']),
      type: $enumDecodeNullable(_$DynamicFormElementTypeEnumMap, json['type']),
      metadata: (json['metadata'] as List<dynamic>?)
          ?.map((e) =>
              DynamicFormElementMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      required: asOrNull(json['required']),
    );

Map<String, dynamic> _$$DynamicFormElementImplToJson(
        _$DynamicFormElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$DynamicFormElementTypeEnumMap[instance.type],
      'metadata': instance.metadata?.map((e) => e.toJson()).toList(),
      'required': instance.required,
    };

const _$DynamicFormElementTypeEnumMap = {
  DynamicFormElementType.radio: 'radio',
  DynamicFormElementType.paragraph: 'paragraph',
};

_$DynamicFormElementMetadataImpl _$$DynamicFormElementMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicFormElementMetadataImpl(
      id: asOrNull(json['id']),
      lable: asOrNull(json['lable']),
      idDefault: asOrNull(json['is_default']),
      isOther: asOrNull(json['is_other']),
    );

Map<String, dynamic> _$$DynamicFormElementMetadataImplToJson(
        _$DynamicFormElementMetadataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lable': instance.lable,
      'is_default': instance.idDefault,
      'is_other': instance.isOther,
    };

_$DynamicFormResponseImpl _$$DynamicFormResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicFormResponseImpl(
      id: asOrNull(json['id']),
      elementId: asOrNull(json['element_id']),
      element: json['element'] == null
          ? null
          : DynamicFormElement.fromJson(
              json['element'] as Map<String, dynamic>),
      formId: asOrNull(json['form_id']),
      optionId: asOrNull(json['option_id']),
      option: json['option'] == null
          ? null
          : DynamicFormElementMetadata.fromJson(
              json['option'] as Map<String, dynamic>),
      answer: asOrNull(json['answer']),
      createdUser: json['created_user'] == null
          ? null
          : User.fromJson(json['created_user'] as Map<String, dynamic>),
      createdAt: asOrNull(json['created_at']),
    );

Map<String, dynamic> _$$DynamicFormResponseImplToJson(
        _$DynamicFormResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'element_id': instance.elementId,
      'element': instance.element?.toJson(),
      'form_id': instance.formId,
      'option_id': instance.optionId,
      'option': instance.option?.toJson(),
      'answer': instance.answer,
      'created_user': instance.createdUser?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
