import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  // factory constructor to check on DioError
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "There are bad certification");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request to ApiServer was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "There are connection error");
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure(
          errorMessage: "No internet connection , please try again later");
        }else{
          return ServerFailure(
          errorMessage: "Ooops there was an error , please try later");
        }
    }
  }

  factory ServerFailure.fromBadResponse(
      int statusCode, Map<String, dynamic> response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: "Not Found , please try later");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: "Internal Server error , please try later");
    } else {
      return ServerFailure(
          errorMessage: "Ooops there was an error , please try later");
    }
  }
}
