import 'package:fintech_mobile_task/presentation/widgets/widgets.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactsCircle extends HookConsumerWidget {
  const ContactsCircle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
            children: [
              const Gap(60),
              Stack(
                children: [
                  Container(
                    width: context.screenWidth(),
                    height: context.screenHeight(.46),
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF0C154B)),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: context.screenWidth(.72),
                        height: context.screenHeight(.33),
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF0C154B)),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: context.screenWidth(.46),
                            height: context.screenHeight(.22),
                            decoration: const ShapeDecoration(
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF0C154B)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const ContactsImage().nudge(
                    y: 100,
                    x: 60,
                  ),
                  const ContactsImage().nudge(
                    y: 35,
                    x: 170,
                  ),
                  const ContactsImage().nudge(
                    y: 225,
                    x: 105,
                  ),
                  const ContactsImage().nudge(
                    y: 315,
                    x: 180,
                  ),
                  const ContactsImage().nudge(
                    y: 260,
                    x: 290,
                  ),
                  const ContactsImage(
                    size: 72,
                    borderColor: Color(0xFF1CC76B),
                  ).nudge(
                    y: 120,
                    x: 235,
                  ),
                ],
              ),
            ],
          );
  }
}