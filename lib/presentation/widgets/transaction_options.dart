import 'package:fintech_mobile_task/core/services/services.dart';
import 'package:fintech_mobile_task/presentation/requests/request_page.dart';
import 'package:fintech_mobile_task/presentation/send_money/send_money.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionOptions extends HookConsumerWidget {
  const TransactionOptions({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextButton(
            onPressed: () => context.navigate(const RequestPage()),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF010A43),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: Color(
                        0xFF464E8A,
                      ),
                    )
                    // side: BorderSide(color: Colors.red)
                    ),
              ),
            ),
            child: const Text(
              'Request Money',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF464E8A),
                fontSize: 16,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Gap(15),
        Flexible(
          child: TextButton(
            onPressed: () => context.navigate(const SendMoneyPage()),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF010A43),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: Color(
                        0xFF464E8A,
                      ),
                    )
                    // side: BorderSide(color: Colors.red)
                    ),
              ),
            ),
            child: const Text(
              'Send Money',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF464E8A),
                fontSize: 16,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
