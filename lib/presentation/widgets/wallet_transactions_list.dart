import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/core.dart';
import 'package:fintech_mobile_task/presentation/widgets/all_transactions_header.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletTransactionsList extends HookConsumerWidget {
  final ScrollController scrollController;
  const WalletTransactionsList({
    required this.scrollController,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletTransactions = ref.watch(
      walletVM.select(
        (value) => value.walletTransactionsModelState,
      ),
    );
    return Container(
      decoration: const ShapeDecoration(
        color: Color(0xFF10194E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: AllTransactionsHeader(),
          ),
          if (walletTransactions.status == RequestStatus.LOADING ||
              walletTransactions.status == RequestStatus.IDLE)
            const Align(
              alignment: Alignment.center,
              child: LinearProgressIndicator(),
            )
          else if (walletTransactions.status == RequestStatus.ERROR)
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Failed to load transactions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontSize: 30,
                  fontFamily: FontFamily.helveticaNeueCyr,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            )
          else
            ListView(
              controller: scrollController,
              children: [
                const Gap(32),
                ...(walletTransactions.data?.transactions ?? []).map(
                  (e) => TransactionListItem(
                    bgColor: (walletTransactions.data?.transactions ?? [])
                                    .indexOf(e) %
                                2 ==
                            0
                        ? const Color(0xFF192259)
                        : const Color(0xFF10194E),
                    status: e,
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}

class TransactionListItem extends HookConsumerWidget {
  const TransactionListItem({
    super.key,
    required this.bgColor,
    required this.status,
  });
  final Color bgColor;
  final Transaction status;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://avatars.githubusercontent.com/u/24194413?s=400&u=988c708592b9f755ee5356629d39829851041724&v=4"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status.fromWallet,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF848EC4),
                  fontSize: 16,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(4),
              Container(
                padding: const EdgeInsets.only(
                  top: 6,
                  left: 8,
                  right: 8,
                  bottom: 4,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: status.transactionStatus.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    status.transactionStatus.statusIcon.svg().nudge(y: -1),
                    const Gap(5),
                    Text(
                      status.transactionStatus.status,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'HelveticaNeueCyr',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FinTechMobileTaskAssets.svg.icNaira
                  .svg(
                    height: 12,
                    width: 12,
                    color: status.transactionStatus.color,
                  )
                  .nudge(y: -1),
              const Gap(4),
              Text(
                '${status.amount}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: status.transactionStatus.color,
                  fontSize: 16,
                  fontFamily: FontFamily.helveticaNeueCyr,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
