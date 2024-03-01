
import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeHeader extends HookConsumerWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        FinTechMobileTaskAssets.svg.icHomeMenu.svg(),
        const Gap(16),
        const Text(
          'Hello Sandra,',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'HelveticaNeueCyr',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF212A6B),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Center(
            child: Text(
              'Add money',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF416DDB),
                fontSize: 14,
                fontFamily: 'HelveticaNeueCyr',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}