// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_api_service.dart';

enum ErrorType {
  noInternet,
  timeout,

  /// occurred when refresh token with invalid token or user not found `or`
  /// status code is 401
  unauthorized,
  unknown,
  badRequest,
  serverUnExpected,
  internalServerError,
  restricted,
}

enum ErrorOrigin {
  dio,
  grapghql,
  firebase,
}

class ErrorData {
  ErrorType? type;
  String? message;
  int? statusCode;
  String? errorCode;
  ErrorOrigin? origin;

  ErrorData({
    this.type,
    this.message,
    this.statusCode,
    this.errorCode,
    this.origin,
  });

  ErrorData.fromDio(dio_p.DioException error) {
    logUtils.i('ErrorData.fromDio', error);

    origin = ErrorOrigin.dio;

    type = ErrorType.unknown;
    message = error.message;

    switch (error.type) {
      case dio_p.DioExceptionType.receiveTimeout:
      case dio_p.DioExceptionType.sendTimeout:
      case dio_p.DioExceptionType.connectionTimeout:
      case dio_p.DioExceptionType.connectionError:
        type = ErrorType.timeout;
        break;
      case dio_p.DioExceptionType.badResponse:
        statusCode = error.response?.statusCode;
        final code = error.response?.data is Map<dynamic, dynamic>
            ? error.response?.data['code']?.toString()
            : null;
        errorCode = code;
        if (errorCode == ServerErrorCode.invalidToken ||
            errorCode == ServerErrorCode.userNotFound ||
            statusCode == 401) {
          type = ErrorType.unauthorized;
          if (error.response?.data is Map<dynamic, dynamic>) {
            message = getErrorMessage(error.response?.data);
          }
        } else {
          type = ErrorType.badRequest;
          if (error.response?.data is Map<dynamic, dynamic>) {
            message = getErrorMessage(error.response?.data);
          }
        }
        break;
      case dio_p.DioExceptionType.cancel:
      case dio_p.DioExceptionType.badCertificate:
        break;
      case dio_p.DioExceptionType.unknown:
        if (error.message?.contains('Unexpected character') == true) {
          type = ErrorType.serverUnExpected;
        } else {
          type = ErrorType.noInternet;
        }
        break;
    }
  }

  ErrorData.fromException({required Exception exception}) {
    type = ErrorType.unknown;
    message = exception.toString();
  }

  String getErrorMessage(Map<String, dynamic> dataRes) {
    logUtils.e('getErrorMessage $dataRes');
    try {
      if (dataRes.containsKey('message') && dataRes['message'] != null) {
        return dataRes['message'].toString();
      }
      if (dataRes.containsKey('error') && dataRes['error'] != null) {
        return dataRes['error'].toString();
      }
      if (dataRes.containsKey('errors') && dataRes['errors'] != null) {
        return dataRes['errors'].toString();
      }
    } catch (e) {
      /* ignore */
    }
    return dataRes.toString();
  }

  ErrorData copyWith({
    ErrorType? type,
    String? message,
    int? statusCode,
    String? errorCode,
  }) {
    return ErrorData(
      type: type ?? this.type,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
