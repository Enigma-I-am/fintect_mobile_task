import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fintech_mobile_task/core/api/api.dart';
import 'package:fintech_mobile_task/core/api/exceptions/exceptions.dart';

/// Lighthouse Authenticated Networking Client
class AuthenticatedDioClient {
  // AuthenticatedDioClient(this.dio);
  final Dio dio;

  AuthenticatedDioClient(this.dio);

  Future<Response<String>> delete(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      dio.delete<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

  Future<Response<String>> get(
    String path, {
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onReceiveProgress,
  }) =>
      dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> head(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      dio.head<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

  Future<Response<String>> patch(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      dio.patch<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> post(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      dio.post<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> put(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      dio.put<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  void requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.putIfAbsent(
      'Content-type',
      () => 'application/json',
    );

    return handler.next(options);
  }

  Response<String> errorInterceptor(
    Response<String> res, {
    bool? shouldThrowErrorIf,
    bool? shouldReturnIf,
    RequestFailure? err,
  }) {
    if (shouldReturnIf == true) {
      return res;
    }

    if ((shouldThrowErrorIf ??
        ((res.statusCode != null &&
                res.statusCode! < 200 &&
                res.statusCode! >= 205) ||
            res.data == null ||
            res.data!.isEmpty))) {
      throw err ?? RequestFailure.transformError(res.data ?? '');
    } else {
      return res;
    }
  }
}
