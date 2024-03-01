import 'package:dartz/dartz.dart';
import 'package:fintech_mobile_task/core/api/api.dart';
import 'package:fintech_mobile_task/core/repositories/repositories.dart';

class WalletRepository extends BaseRepository {
  WalletRepository({
    required WalletClient accountCreationApiClient,
  }) : _accountCreationApiClient = accountCreationApiClient;

  final WalletClient _accountCreationApiClient;

  Future<Either<RequestFailure, RegisterModel>> register({
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      final res = await _accountCreationApiClient.register(
        body: {
          "username": userName,
          "password": password,
          "email": email,
        },
      );

      return Right(res);
    } catch (e, s) {
      return handleEdenRequestFailure(e, s);
    }
  }

  Future<Either<RequestFailure, LoginModel>> login({
    required String userName,
    required String password,
  }) async {
    try {
      final res = await _accountCreationApiClient.login(
        body: {
          "username": userName,
          "password": password,
        },
      );

      return Right(res);
    } catch (e, s) {
      return handleEdenRequestFailure(e, s);
    }
  }

  Future<Either<RequestFailure, WalletBalanceModel>> getWalletBalance() async {
    try {
      final res = await _accountCreationApiClient.getWalletBalance();
      return Right(res);
    } catch (e, s) {
      return handleEdenRequestFailure(e, s);
    }
  }

  Future<Either<RequestFailure, WalletTransactions>>
      getWalletTransactions() async {
    try {
      final res = await _accountCreationApiClient.getWalletTransactions();
      return Right(res);
    } catch (e, s) {
      return handleEdenRequestFailure(e, s);
    }
  }
}
