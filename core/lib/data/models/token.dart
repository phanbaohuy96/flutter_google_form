import 'package:json_annotation/json_annotation.dart';

import '../../common/utils.dart';

part 'token.g.dart';

enum TokenType {
  @JsonValue('jwt')
  jwt('jwt'),
  @JsonValue('firebase')
  firebase('firebase'),
  ;

  const TokenType(this.value);
  final String value;
}

@JsonSerializable(explicitToJson: true)
class UserToken {
  @JsonKey(name: 'access_token', fromJson: asOrNull)
  final String? accessToken;
  @JsonKey(name: 'refresh_token', fromJson: asOrNull)
  final String? refreshRoken;
  @JsonKey(
    name: 'token_type',
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  final TokenType? type;
  @JsonKey(name: 'expires_in', fromJson: asOrNull)
  int? expireIn;
  @JsonKey(name: 'scope', fromJson: asOrNull)
  final List<String>? scope;

  UserToken({
    this.accessToken,
    this.refreshRoken,
    this.type,
    this.scope,
    this.expireIn,
  });

  UserToken copyWith({
    String? token,
    String? refreshRoken,
    TokenType? type,
    int? expireIn,
    List<String>? scope,
  }) {
    return UserToken(
      accessToken: token ?? accessToken,
      refreshRoken: refreshRoken ?? this.refreshRoken,
      type: type ?? this.type,
      expireIn: expireIn ?? this.expireIn,
      scope: scope ?? this.scope,
    );
  }

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenToJson(this);

  @override
  bool operator ==(covariant UserToken other) {
    if (identical(this, other)) {
      return true;
    }

    return other.accessToken == accessToken && other.type == type;
  }

  @override
  int get hashCode => accessToken.hashCode ^ type.hashCode;

  String get authorization => '${type?.value} $accessToken';

  bool get isValid => type != null && accessToken.isNotNullOrEmpty;

  @override
  String toString() {
    return '''Token(
  token: $accessToken, 
  refreshRoken: $refreshRoken, 
  type: $type, 
  expireIn: $expireIn, 
  scope: $scope
)''';
  }
}
