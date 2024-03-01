import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/presentation/widgets/widgets.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestPage extends HookConsumerWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      backgroundColor: const Color(0xFF010A43),
      headerWidget: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseBackButton(),
          Spacer(),
          Text(
            'New Request',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD6C9C9),
              fontSize: 18,
              fontFamily: FontFamily.helveticaNeueCyr,
              fontWeight: FontWeight.w500,
              height: 0.08,
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
      bgWidget: FinTechMobileTaskAssets.svg.icDefaultBg.svg(
        fit: BoxFit.cover,
        width: context.screenWidth(),
      ),
      flexibleChildren: [
        const Gap(40),
        const UserImage(),
        const Gap(74),
        const Text(
          'Adeleke Ramon',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFEEEEEE),
            fontSize: 24,
            fontFamily: FontFamily.helveticaNeueCyr,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(30),
        const Text(
          'is requesting for:',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFEEEEEE),
            fontSize: 14,
            fontFamily: FontFamily.helveticaNeueCyr,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(30),
        const WalletBalanceWidget(),
        const Gap(48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Send money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
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
                'Don’t send',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF464E8A),
                  fontSize: 16,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


