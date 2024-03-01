import 'dart:convert';

import 'package:equatable/equatable.dart';

class WalletBalanceModel with EquatableMixin {
  final double balance;
  final String currency;
  WalletBalanceModel({
    required this.balance,
    required this.currency,
  });

  WalletBalanceModel copyWith({
    double? balance,
    String? currency,
  }) {
    return WalletBalanceModel(
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'currency': currency,
    };
  }

  factory WalletBalanceModel.fromMap(Map<String, dynamic> map) {
    return WalletBalanceModel(
      balance: map['balance']?.toDouble() ?? 0.0,
      currency: map['currency'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletBalanceModel.fromJson(String source) =>
      WalletBalanceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WalletBalanceModel(balance: $balance, currency: $currency)';


  @override
  List<Object?> get props => [
        balance,
        currency,
      ];
}
