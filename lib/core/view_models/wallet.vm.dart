import 'package:fintech_mobile_task/core/core.dart';
import 'package:fintech_mobile_task/presentation/home/home.dart';
import 'package:flutter/material.dart';

class WalletVM extends ChangeNotifier {
  WalletVM(this.walletRepository);

  final WalletRepository walletRepository;

  RequestState<RegisterModel> _registerModelState = RequestState.idle();
  RequestState<RegisterModel> get registerModelState => _registerModelState;
  set registerModelState(RequestState<RegisterModel> val) {
    _registerModelState = val;
    notifyListeners();
  }

  RequestState<LoginModel> _loginModelState = RequestState.idle();
  RequestState<LoginModel> get loginModelState => _loginModelState;
  set loginModelState(RequestState<LoginModel> val) {
    _loginModelState = val;
    notifyListeners();
  }

  RequestState<WalletBalanceModel> _walletBalanceModelState =
      RequestState.idle();
  RequestState<WalletBalanceModel> get walletBalanceModelState =>
      _walletBalanceModelState;
  set walletBalanceModelState(RequestState<WalletBalanceModel> val) {
    _walletBalanceModelState = val;
    notifyListeners();
  }

  RequestState<WalletTransactions> _walletTransactionsModelState =
      RequestState.idle();
  RequestState<WalletTransactions> get walletTransactionsModelState =>
      _walletTransactionsModelState;
  set walletTransactionsModelState(RequestState<WalletTransactions> val) {
    _walletTransactionsModelState = val;
    notifyListeners();
  }

  Future<void> register({
    required String userName,
    required String password,
    required String email,
  }) async {
    registerModelState = RequestState.loading('');
    final res = await walletRepository.register(
      userName: userName,
      password: password,
      email: email,
    );

    res.fold(
      (l) => registerModelState = RequestState.error(l.message),
      (r) => login(userName: r.username, password: r.password),
    );
  }

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    loginModelState = RequestState.loading('');
    final res = await walletRepository.login(
      userName: userName,
      password: password,
    );

    res.fold(
      (l) => loginModelState = RequestState.error(l.message),
      (r) {
        loginModelState = RequestState.completed(r);
        navigator.pushTo(const HomePage());
      },
    );
  }

  Future<void> loadWalletBalance() async {
    walletBalanceModelState = RequestState.loading('');
    final res = await walletRepository.getWalletBalance();

    res.fold(
      (l) => walletBalanceModelState = RequestState.error(l.message),
      (r) => walletBalanceModelState = RequestState.completed(r),
    );
  }

  Future<void> loadWalletTransactions() async {
    walletTransactionsModelState = RequestState.loading('');
    final res = await walletRepository.getWalletTransactions();

    res.fold(
      (l) => walletTransactionsModelState = RequestState.error(l.message),
      (r) => walletTransactionsModelState = RequestState.completed(r),
    );
  }
}
