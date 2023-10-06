import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServerFaliure extends Failures {
  ServerFaliure(super.errMessage);
  factory ServerFaliure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('connection Time out with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure('Send Time out with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Receive Time out with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFaliure('bad Certificate');
        {}
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFaliure('Request to Api server was canceld');
      case DioExceptionType.connectionError:
        return ServerFaliure('connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketExcption')) {
          return ServerFaliure('No internet connection');
        }
        return ServerFaliure('unexpacted connection, please try again');
    }
  }
  factory ServerFaliure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure('Your request Not found, please try later');
    } else if (statusCode == 500) {
      return ServerFaliure('Internal Server Error, please try later');
    } else {
      return ServerFaliure('Oop there is an error, please try later');
    }
  }
}
