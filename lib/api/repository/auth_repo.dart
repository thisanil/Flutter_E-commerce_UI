import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/app-config.dart';
import 'package:pravaah_ecommerce/common/constant/app_utils.dart';
import 'package:pravaah_ecommerce/screen/auth/login_screen.dart';

class APIRepository {
  final Dio dio = Dio(BaseOptions(
      baseUrl: AppConfig.host,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      contentType: "application/json",
      followRedirects: false,
      receiveDataWhenStatusError: true));

  APIRepository() {
    dio.interceptors.add(LogInterceptor(
        responseBody: !kReleaseMode,
        requestBody: !kReleaseMode,
        requestHeader: !kReleaseMode,
        responseHeader: !kReleaseMode,
        error: !kReleaseMode,
        logPrint: (object) {
          if (!kReleaseMode) {
            debugPrint(object.toString());
          }
        },
        request: !kReleaseMode));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = await AppUtils().getToken();
        options.headers["Authorization"] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            await AppUtils().logout();
            Get.offAll(LoginScreen());
          } catch (e) {
            debugPrint(e.toString());
          }
        }
      },
    ));
  }
}
