import 'package:dio/dio.dart' show DioExceptionType, DioException;

abstract class Failure {
  final String errormsg;

  Failure(this.errormsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormsg);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        // التأكد من أن الـ response والـ statusCode ليسوا null
        if (dioError.response != null &&
            dioError.response!.statusCode != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode!,
            dioError.response!.data,
          );
        }
        return ServerFailure('Bad response, please try again');
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');
      case DioExceptionType.unknown:
        // استخدام ?. و ?? لتجنب الـ Null Check Error
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps there was an error, please try again!!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // حماية إضافية في حال كان السيرفر يرسل الخطأ بشكل مختلف
      try {
        return ServerFailure(response['error']['message']);
      } catch (e) {
        return ServerFailure('Authentication or validation error');
      }
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try again');
    }
    if (statusCode == 429) {
      return ServerFailure(
        'Too many requests. Please wait a moment and try again.',
      );
    } else {
      return ServerFailure('Opps there was an error, please try again');
    }
  }
}
