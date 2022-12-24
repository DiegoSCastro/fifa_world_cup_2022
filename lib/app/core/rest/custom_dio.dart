import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:fifa_world_cup_2022/app/core/rest/interceptors/auth_interceptor.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['BACKEND_BASE_URL'] ?? '',
            connectTimeout: int.tryParse(Env.i['CONNECT_TIMEOUT'] ?? '5000') ?? 5000,
            receiveTimeout: int.tryParse(Env.i['RECEIVE_TIMEOUT'] ?? '30000') ?? 30000,
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
