import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final bool? status;
  final String? message;
  final String? token;
  final UserResponse? response;

  RegisterResponseModel({this.status, this.message, this.token, this.response});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

@JsonSerializable()
class UserResponse {
  final String? name;
  final String? email;
  final String? phone;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final int? id;

  @JsonKey(name: 'profile_picture_url')
  final String? profilePictureUrl;

  UserResponse({
    this.name,
    this.email,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePictureUrl,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
