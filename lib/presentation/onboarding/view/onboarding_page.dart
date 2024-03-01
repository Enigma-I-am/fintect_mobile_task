import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/services/navigation.service.dart';
import 'package:fintech_mobile_task/presentation/onboarding/view/login_page.dart';
import 'package:fintech_mobile_task/presentation/onboarding/view/register_page.dart';
import 'package:fintech_mobile_task/presentation/widgets/base_scaffold.dart';
import 'package:fintech_mobile_task/utils/constants.dart';
import 'package:fintech_mobile_task/utils/global.extensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class OnboardingPage extends StatefulHookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  final onBoardingData = const [
    {
      "title": 'Transfer Money With Ease',
      "sub_text":
          "Making money is hard enough, we make transfering it easy enough.",
    },
    {
      "title": 'Transfer Money With Ease',
      "sub_text":
          "Making money is hard enough, we make transfering it easy enough.",
    },
    {
      "title": 'Transfer Money With Ease',
      "sub_text":
          "Making money is hard enough, we make transfering it easy enough.",
    },
  ];

  final sections = [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: .01,
          // fit: BoxFit.cover,
          image: Svg(
            FinTechMobileTaskAssets.svg.icSplashBg.path,
            scale: .01,
            //FinTechMobileTaskAssets.svg.icSecSplashBg.path,
          ),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: .01,
          // fit: BoxFit.cover,
          image: Svg(
            FinTechMobileTaskAssets.svg.icSecSplashBg.path,
            scale: .01,
            //FinTechMobileTaskAssets.svg.icSecSplashBg.path,
          ),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: .01,
          // fit: BoxFit.cover,
          image: Svg(
            FinTechMobileTaskAssets.svg.icSplashBg.path,
            scale: .01,
            //FinTechMobileTaskAssets.svg.icSecSplashBg.path,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return BaseScaffold(
      bgWidget: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        duration: const Duration(seconds: 2),
        child: sections.elementAt(currentPage),
      ),
      bottomWidgetAlignment: Alignment.bottomLeft,
      bottomButton: Container(
        height: context.screenHeight(.265),
        width: context.screenWidth(.87),
        padding: const EdgeInsets.only(left: 32, top: 32, bottom: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Gap(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                sections.length,
                (index) => buildDot(index: index, currentPage: currentPage),
              ),
            ),
            const Gap(18),
            SizedBox(
              height: 90,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardingData.length,
                itemBuilder: (ctx, index) => OnboardingText(
                  title: onBoardingData[index]['title'] ?? '',
                  subText: onBoardingData[index]['sub_text'] ?? '',
                ),
                onPageChanged: (val) {
                  setState(() {
                    currentPage = val;
                  });
                },
              ),
            ),
            // const Gap(16),
            TextButton(
              onPressed: () {
                if (currentPage == 0) {
                  context.navigate(const LoginPage());
                } else {
                  context.navigate(const RegisterPage());
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFF1C265C),
                ),
              ),
              child: Text(
                currentPage == 1 ? 'Log in' : 'Start banking',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildDot({int index = 0, int currentPage = 0}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 32 : 16,
    decoration: BoxDecoration(
      color: currentPage == index
          ? const Color(0xFFFFB129)
          : const Color(0xFFFDD590),
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
    required this.title,
    required this.subText,
  });
  final String title, subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNeueCyr,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF1C265C),
          ),
        ),
        const Gap(4),
        SizedBox(
          width: context.screenWidth(.6),
          child: Text(
            subText,
            style: const TextStyle(
              color: Color(0xFF28336F),
              fontSize: 14,
              fontFamily: FontFamily.helveticaNeueCyr,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
