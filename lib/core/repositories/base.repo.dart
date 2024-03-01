import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fintech_mobile_task/core/api/api.dart';

class BaseRepository {
  Left<RequestFailure, T> handleEdenRequestFailure<T>(
    Object e, [
    StackTrace? s,
  ]) {
    if (e is RequestFailure) {
      return Left(e);
    }

    if (e is DioException) {
      if (e.response != null &&
          e.response?.data.toString().isNotEmpty == true) {
        return Left(RequestFailure.fromJson(e.response!.data));
      }
      return const Left(RequestFailure.unableToSend);
    }

    return const Left(RequestFailure.unableToProcess);
  }
}
