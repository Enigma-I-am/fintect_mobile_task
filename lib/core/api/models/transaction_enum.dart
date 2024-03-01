import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum TransactionStatusEnum {
  recieved('credit'),
  // pending('pending'),
  sent('debit'),
  failed('failed'),
  // ignore: constant_identifier_names
  none('');

  const TransactionStatusEnum(this.value);

  final String value;

  factory TransactionStatusEnum.fromString(String? str) {
    return TransactionStatusEnum.values.firstWhereOrNull(
          (it) => it.value == str?.toLowerCase(),
        ) ??
        none;
  }

  factory TransactionStatusEnum.fromIndex(int index) => switch (index) {
        0 => TransactionStatusEnum.recieved,
        1 => TransactionStatusEnum.sent,
        2 => TransactionStatusEnum.failed,
        _ => TransactionStatusEnum.none,
      };

  Color get color => switch (this) {
        recieved => const Color(0xFF1DC7AC),
        sent => const Color(0xFFFAAD39),
        failed => const Color(0xFFFE4A54),
        none => const Color(0xFFFE4A54),
      };

  String get status => switch (this) {
        recieved => 'Recieved',
        sent => 'Sent',
        failed => 'Failed',
        none => 'Failed',
      };

  SvgGenImage get statusIcon => switch (this) {
        recieved => FinTechMobileTaskAssets.svg.icReceived,
        sent => FinTechMobileTaskAssets.svg.icSent,
        failed => FinTechMobileTaskAssets.svg.icFailure,
        none => FinTechMobileTaskAssets.svg.icFailure,
      };
}
