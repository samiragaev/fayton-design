import 'package:dio/dio.dart';

sealed class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  factory AppException.fromDioException(DioException exception) {
    final error = exception.error;
    if (error is AppException) return error;

    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const RequestTimeoutException(),
      DioExceptionType.connectionError => const NetworkException(),
      DioExceptionType.cancel => const RequestCancelledException(),
      DioExceptionType.badCertificate => const BadCertificateException(),
      DioExceptionType.badResponse => _fromResponse(exception.response),
      DioExceptionType.unknown => const UnknownException(),
    };
  }

  static AppException _fromResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;
    final serverMessage = _extractMessage(response?.data);

    return switch (statusCode) {
      400 || 422 => BadRequestException(serverMessage, statusCode),
      401 => UnauthorizedException(serverMessage),
      403 => ForbiddenException(serverMessage),
      404 => NotFoundException(serverMessage),
      final int code when code >= 500 => ServerException(serverMessage, code),
      _ => UnknownException(serverMessage, statusCode),
    };
  }

  static String? _extractMessage(Object? data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'] ?? data['detail'];
      if (message is String && message.isNotEmpty) return message;
    }
    return null;
  }

  @override
  String toString() =>
      '$runtimeType(statusCode: $statusCode, message: $message)';
}

final class NetworkException extends AppException {
  const NetworkException([String? message])
    : super(message ?? 'İnternet bağlantısı yoxdur. Bağlantını yoxlayın.');
}

final class RequestTimeoutException extends AppException {
  const RequestTimeoutException([String? message])
    : super(message ?? 'Sorğunun vaxtı bitdi. Yenidən cəhd edin.');
}

final class RequestCancelledException extends AppException {
  const RequestCancelledException([String? message])
    : super(message ?? 'Sorğu ləğv edildi.');
}

final class BadCertificateException extends AppException {
  const BadCertificateException([String? message])
    : super(message ?? 'Təhlükəsiz bağlantı qurula bilmədi.');
}

final class BadRequestException extends AppException {
  const BadRequestException([String? message, int? statusCode])
    : super(
        message ?? 'Göndərilən məlumatlar yanlışdır.',
        statusCode: statusCode ?? 400,
      );
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message])
    : super(message ?? 'E-poçt və ya şifrə yanlışdır.', statusCode: 401);
}

final class ForbiddenException extends AppException {
  const ForbiddenException([String? message])
    : super(message ?? 'Bu əməliyyat üçün icazəniz yoxdur.', statusCode: 403);
}

final class NotFoundException extends AppException {
  const NotFoundException([String? message])
    : super(message ?? 'Məlumat tapılmadı.', statusCode: 404);
}

final class ServerException extends AppException {
  const ServerException([String? message, int? statusCode])
    : super(
        message ?? 'Server xətası baş verdi. Bir az sonra yenidən cəhd edin.',
        statusCode: statusCode ?? 500,
      );
}

final class ParseException extends AppException {
  const ParseException([String? message])
    : super(message ?? 'Serverdən gələn cavab emal edilə bilmədi.');
}

final class UnknownException extends AppException {
  const UnknownException([String? message, int? statusCode])
    : super(message ?? 'Gözlənilməz xəta baş verdi.', statusCode: statusCode);
}
