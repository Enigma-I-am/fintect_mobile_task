import 'package:fintech_mobile_task/core/core.dart';
import 'package:fintech_mobile_task/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(walletVM)
          ..loadWalletBalance()
          ..loadWalletTransactions();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: const Color(0xFF010A43),
      child: Stack(
        children: [
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(),
                  Gap(60),
                  Text(
                    'Your current balance is',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE6E3E3),
                      fontSize: 12,
                      fontFamily: 'HelveticaNeueCyr',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(16),
                  WalletBalanceWidget(
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Gap(32),
                  TransactionOptions()
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.93,
            initialChildSize: 0.53,
            minChildSize: 0.53,
            snap: true,
            builder: (context, scrollController) => WalletTransactionsList(
              scrollController: scrollController,
            ),
          )
        ],
      ),
    );
  }
}
