import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/presentation/widgets/widgets.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendMoneyPage extends StatefulHookConsumerWidget {
  const SendMoneyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends ConsumerState<SendMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          const ContactsCircle(),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  // vertical: 4,
                ),
                child: Row(
                  children: [
                    const BaseBackButton(),
                    Container(
                      height: 48,
                      width: context.screenWidth(.76),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const TextField(
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 14,
                          fontFamily: FontFamily.helveticaNeueCyr,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderSide: BorderSide(
                              color: Color(0xFF1DC7AC),
                              width: 0.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1DC7AC),
                              width: 0.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.38,
            initialChildSize: 0.38,
            minChildSize: 0.38,
            snap: true,
            builder: (context, scrollController) {
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
                    SafeArea(
                      top: false,
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    'https://avatars.githubusercontent.com/u/140277151?v=4',
                                    height: 72,
                                    width: 72,
                                    fit: BoxFit.cover),
                              ),
                            ],
                          ),
                          const Gap(16),
                          const Text(
                            'Adeleke Adeyanju',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'HelveticaNeueCyr',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(16),
                          const Text(
                            '(+234) 905 1694 275',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'HelveticaNeueCyr',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                    const Size(147, 60),
                                  ),
                                ),
                                onPressed: () =>
                                    SelectTestAccountModalBottomSheet.show(),
                                child: const Text(
                                  'Continue',
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
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 64,
                        height: 7,
                        margin: const EdgeInsets.only(top: 8, bottom: 4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4E589F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
