import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shark_mobile/core/networking/end_points.dart';
import 'package:shark_mobile/features/auth/data/models/register/request/register_request_model.dart';
import 'package:shark_mobile/features/auth/data/models/register/response/register_response_model.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.apiBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiEndPoints.register)
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel body);
}
