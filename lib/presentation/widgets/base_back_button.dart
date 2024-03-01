import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseBackButton extends HookConsumerWidget {
  const BaseBackButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xFFD7C9C9),
          ),
          Gap(4),
          Text(
            'Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD7C9C9),
              fontSize: 14,
              fontFamily: FontFamily.helveticaNeueCyr,
              fontWeight: FontWeight.w400,
              // height: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}