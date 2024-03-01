import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fintech_mobile_task/core/api/models/transaction_enum.dart';

class WalletTransactions with EquatableMixin {
  final List<Transaction> transactions;
  WalletTransactions({
    required this.transactions,
  });

  WalletTransactions copyWith({
    List<Transaction>? transactions,
  }) {
    return WalletTransactions(
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory WalletTransactions.fromMap(Map<String, dynamic> map) {
    return WalletTransactions(
      transactions: List<Transaction>.from(
        map['transactions']?.map(
          (x) => Transaction.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletTransactions.fromJson(String source) =>
      WalletTransactions.fromMap(json.decode(source));

  @override
  @override
  List<Object?> get props => [transactions];
}

class Transaction with EquatableMixin {
  final String id;
  final String fromWallet;
  final String type;
  final double amount;
  final String currency;
  final String timestamp;
  Transaction({
    required this.id,
    required this.fromWallet,
    required this.type,
    required this.amount,
    required this.currency,
    required this.timestamp,
  });

  TransactionStatusEnum get transactionStatus =>
      TransactionStatusEnum.fromString(type);

  Transaction copyWith({
    String? id,
    String? fromWallet,
    String? type,
    double? amount,
    String? currency,
    String? timestamp,
  }) {
    return Transaction(
      id: id ?? this.id,
      fromWallet: fromWallet ?? this.fromWallet,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'currency': currency,
      'timestamp': timestamp,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] ?? '',
      fromWallet: map['from_wallet'] ?? map['to_wallet'] ?? '',
      type: map['type'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      currency: map['currency'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        fromWallet,
        type,
        amount,
        currency,
        timestamp,
      ];
}
