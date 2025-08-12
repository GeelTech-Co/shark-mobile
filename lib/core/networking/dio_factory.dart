import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shark_mobile/core/helpers/constants.dart';
import 'package:shark_mobile/core/helpers/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      await addDioHeader(); //  headers الأساسية
      addDioInterceptor(); //  interceptor لكل الريكويستات

      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> clearTokenFromHeaders() async {
    dio?.options.headers.remove('Authorization');
  }

  ///  Interceptor يتم تنفيذها تلقائيًا قبل كل request
  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token =
              await getAccessToken(); //  جلب التوكن من SecureStorage أو SessionManager
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  ///  تستخدمها مباشرة بعد تسجيل الدخول لتحديث الهيدر الحالي
  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  ///  headers يتم تهيئتها أول مرة مع التوكن
  static Future<void> addDioHeader() async {
    final token = await getAccessToken(); //  استخدم نفس الدالة الموحدة
    dio?.options.headers = {
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  /// ✅ دالة موحدة لجلب التوكن من SharedPrefs أو SessionManager
  static Future<String?> getAccessToken() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    if (token != null && token.isNotEmpty) return token;

    return token;
  }
}
