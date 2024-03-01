import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllTransactionsHeader extends HookConsumerWidget {
  const AllTransactionsHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 7,
                decoration: ShapeDecoration(
                  color: const Color(0xFF4E589F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          const Gap(24),
          const Row(
            children: [
              Text(
                'All Transactions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
              Spacer(),
              Text(
                'Sort by:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4E589F),
                  fontSize: 14,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(9),
              Text(
                'Recent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFDDD9D9),
                  fontSize: 14,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(9),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}