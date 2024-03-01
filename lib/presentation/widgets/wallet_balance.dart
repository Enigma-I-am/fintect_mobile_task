import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/core.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletBalanceWidget extends HookConsumerWidget {
  const WalletBalanceWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletBalanceModelState = ref.watch(
      walletVM.select(
        (value) => value.walletBalanceModelState,
      ),
    );

    final walletBalnce = switch (walletBalanceModelState.status) {
      RequestStatus.COMPLETED => walletBalanceModelState.data?.balance,
      _ => 0.0,
    };
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FinTechMobileTaskAssets.svg.icNaira
            .svg(
              height: 28,
            )
            .nudge(y: -4),
        const Gap(6),
        Text(
          '$walletBalnce',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFEEEEEE),
            fontSize: 40,
            fontFamily: FontFamily.helveticaNeueCyr,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        )
      ],
    );
  }
}
