import 'package:shark_mobile/core/networking/api_result.dart';
import 'package:shark_mobile/features/auth/data/models/register/request/register_request_model.dart';
import 'package:shark_mobile/features/auth/data/models/register/response/register_response_model.dart';

abstract class AuthRepo {
  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestModel registerRequestBody,
  );
}
