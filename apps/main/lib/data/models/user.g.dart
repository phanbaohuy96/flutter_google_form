// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: asOrNull(json['id']),
      displayName: asOrNull(json['display_name']),
      birthday: asOrNull(json['birthday']),
      email: asOrNull(json['email']),
      phoneCode: asOrNull(json['phone_code']),
      phoneNumber: asOrNull(json['phone_number']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'birthday': instance.birthday?.toIso8601String(),
      'email': instance.email,
      'phone_code': instance.phoneCode,
      'phone_number': instance.phoneNumber,
    };
