import "package:json_annotation/json_annotation.dart";

part "account_auth.g.dart";

@JsonSerializable()
class AccountAuth {
  AccountAuth({
    required this.accessToken,
    required this.refreshToken,
  });
  factory AccountAuth.fromJson(final Map<String, dynamic> json) => _$AccountAuthFromJson(json);

  final String accessToken;
  final String refreshToken;
}
