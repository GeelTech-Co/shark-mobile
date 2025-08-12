// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  status: json['status'] as bool?,
  message: json['message'] as String?,
  token: json['token'] as String?,
  response: json['response'] == null
      ? null
      : UserResponse.fromJson(json['response'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'token': instance.token,
  'response': instance.response,
};

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  updatedAt: json['updated_at'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  profilePictureUrl: json['profile_picture_url'] as String?,
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'profile_picture_url': instance.profilePictureUrl,
    };
