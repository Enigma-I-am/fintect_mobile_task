import 'package:fintech_mobile_task/core/api/api.dart';

/// {@template lighthouse_api_client}
/// Dart API Client which wraps the [Api]().
/// {@endtemplate}
class WalletClient {
  /// {@macro lighthouse_api_client}
  WalletClient({
    required AuthenticatedDioClient client,
  }) : _client = client;

  final AuthenticatedDioClient _client;

  // / Create User Account
  Future<RegisterModel> register({
    required Map<String, Object> body,
  }) async {
    final req = await _client.post(
      ApiUrl.register,
      data: body,
    );

    final res = _client.errorInterceptor(req);
    return RegisterModel.fromJson(res.data ?? '{}');
  }

  Future<LoginModel> login({
    required Map<String, Object> body,
  }) async {
    final req = await _client.post(
      ApiUrl.login,
      data: body,
    );

    final res = _client.errorInterceptor(req);
    return LoginModel.fromJson(res.data ?? '{}');
  }

  Future<WalletBalanceModel> getWalletBalance() async {
    final req = await _client.get(
      ApiUrl.balance,
    );

    final res = _client.errorInterceptor(req);
    return WalletBalanceModel.fromJson(res.data ?? '{}');
  }

  Future<WalletTransactions> getWalletTransactions() async {
    final req = await _client.get(
      ApiUrl.transactions,
    );

    final res = _client.errorInterceptor(req);
    return WalletTransactions.fromJson(res.data ?? '{}');
  }
}
