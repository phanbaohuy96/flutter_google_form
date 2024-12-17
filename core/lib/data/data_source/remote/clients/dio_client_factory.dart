import 'package:dio/dio.dart' as dio_p;

import '../../../../common/services/header/request_header_service.dart';
import '../../../../di/core_micro.dart';
import '../../local/local_data_manager.dart';
import '../interceptor/logger_interceptor.dart';

class DioClientFactory {
  static dio_p.Dio build({
    required CoreLocalDataManager localDataManager,
  }) {
    final dio = dio_p.Dio(
      dio_p.BaseOptions(
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 30000),
        sendTimeout: const Duration(seconds: 30000),
      ),
    );

    dio.options.headers.clear();

    dio.options.headers = injector<RequestHeaderService>().requestHeaders;

    /// Dio InterceptorsWrapper
    // dio.interceptors.add(
    //   AuthInterceptor(
    //     getToken: () {
    //       final token = authService.token;
    //       return token.isNotNullOrEmpty ? '$token' : null;
    //     },
    //     refreshToken: (token, options) async {
    //       return authService.refreshToken();
    //     },
    //     onLogoutRequest: () {
    //       unawaited(localDataManager.clearData());
    //     },
    //     refreshTokenPath: ApiContract.refreshToken,
    //     logoutPath: ApiContract.logout,
    //   ),
    // );
    dio.interceptors.add(
      LoggerInterceptor(
        ignoreReponseDataLog: (response) {
          // return response.requestOptions.path == ApiContract.administrative;
          return false;
        },
      ),
    );

    return dio;
  }
}
