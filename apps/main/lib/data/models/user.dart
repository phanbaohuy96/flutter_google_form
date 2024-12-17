import 'package:core/common/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum AccountStatus { blocked, active, deleted, block }

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'id', fromJson: asOrNull)
  String? id;
  @JsonKey(name: 'display_name', fromJson: asOrNull)
  String? displayName;
  @JsonKey(name: 'birthday', fromJson: asOrNull)
  DateTime? birthday;
  @JsonKey(name: 'email', fromJson: asOrNull)
  String? email;
  @JsonKey(name: 'phone_code', fromJson: asOrNull)
  int? phoneCode;
  @JsonKey(name: 'phone_number', fromJson: asOrNull)
  String? phoneNumber;

  User({
    this.id,
    this.displayName,
    this.birthday,
    this.email,
    this.phoneCode,
    this.phoneNumber,
  });

  User copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? displayName,
    ValueGetter<DateTime?>? birthday,
    ValueGetter<String?>? email,
    ValueGetter<int?>? phoneCode,
    ValueGetter<String?>? phoneNumber,
  }) {
    return User(
      id: id != null ? id() : this.id,
      displayName: displayName != null ? displayName() : this.displayName,
      birthday: birthday != null ? birthday() : this.birthday,
      email: email != null ? email() : this.email,
      phoneCode: phoneCode != null ? phoneCode() : this.phoneCode,
      phoneNumber: phoneNumber != null ? phoneNumber() : this.phoneNumber,
    );
  }

  String get displayAge {
    if (birthday == null) {
      return '';
    }
    return CoreCommonFunction().calculateAge(birthday!).toString();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
