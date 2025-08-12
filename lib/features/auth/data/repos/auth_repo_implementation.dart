import 'package:shark_mobile/core/networking/api_error_handler.dart';
import 'package:shark_mobile/core/networking/api_result.dart';
import 'package:shark_mobile/features/auth/data/apis/auth_api_service.dart';
import 'package:shark_mobile/features/auth/data/models/register/request/register_request_model.dart';
import 'package:shark_mobile/features/auth/data/models/register/response/register_response_model.dart';
import 'package:shark_mobile/features/auth/data/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final AuthApiService _apiService;

  AuthRepoImplementation(this._apiService);
  @override
  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestModel registerRequestBody,
  ) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
 
}
