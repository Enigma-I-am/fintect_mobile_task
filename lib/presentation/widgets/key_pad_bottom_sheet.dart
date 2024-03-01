import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/services/navigation.service.dart';
import 'package:fintech_mobile_task/presentation/widgets/bottom_sheet.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectTestAccountModalBottomSheet extends StatelessWidget {
  SelectTestAccountModalBottomSheet({
    super.key,
  });

  static Future<void> show() => BaseBottomSheet.showClose<void>(
        child: SelectTestAccountModalBottomSheet(),
        padding: EdgeInsets.zero,
        onClose: () => navigator.pop(),
      );

  final List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '<',
  ];

  @override
  Widget build(BuildContext context) {
    return SheetCard(
      color: const Color(0xFF010A43),
      height: context.screenHeight(.862),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(72),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FinTechMobileTaskAssets.svg.icNaira
                  .svg(
                    height: 40,
                  )
                  .nudge(y: -4),
              const Gap(8),
              const Text(
                '0.00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontSize: 64,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w700,
                  height: 0.02,
                ),
              ),
            ],
          ),
          const Gap(80),
          Flexible(
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1,
              mainAxisSpacing: 2.0,
              children: numberList.map((String value) {
                return NumberButton(
                  value: value,
                  onPressed: () {
                    // Handle button press here
                    print('Pressed: $value');
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String value;
  final Function onPressed;

  NumberButton({super.key, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget icons = switch (value) {
      '<' => const Icon(
          Icons.backspace_outlined,
          size: 24,
          color: Colors.white,
        ),
      _ => Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: FontFamily.helveticaNeueCyr,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
    };
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      ),
      child: icons,
    );
  }
}
