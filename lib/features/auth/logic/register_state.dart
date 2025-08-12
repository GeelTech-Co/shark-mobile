import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shark_mobile/core/networking/api_error_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  // sign_up
  const factory RegisterState.initial() = _Initial<T>;
  const factory RegisterState.registerLoading() = RegisterLoading;
  const factory RegisterState.registerSuccess(T data) = RegisterSuccess<T>;
  const factory RegisterState.registerError(ApiErrorModel apiErrorModel) =
      RegisterError;
}
