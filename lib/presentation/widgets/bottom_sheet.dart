import 'dart:ui';

import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/core/services/navigation.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BaseBottomSheet<T> extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  static Future<K?> show<K>({
    required Widget child,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    bool? isDismissible,
  }) =>
      showCupertinoModalBottomSheet(
        topRadius: const Radius.circular(40),
        context: navigator.context,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadow: const BoxShadow(color: Colors.transparent),
        isDismissible: isDismissible,
        enableDrag: isDismissible ?? true,
        barrierColor: const Color(0xFF271D17).withOpacity(.4),
        builder: (context) {
          return BaseBottomSheet<K>(
            padding: padding,
            child: child,
          );
        },
      );

  static Future<C?> showClose<C>({
    required Widget child,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    bool isDismissible = true,
    bool isModalBack = false,
    void Function()? onClose,
  }) {
    return show<C>(
      padding: padding,
      backgroundColor: backgroundColor ?? Colors.transparent,
      isDismissible: isDismissible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onClose,
                child: FinTechMobileTaskAssets.svg.icCloseModal.svg(),
              ),
            ],
          ),
          const Gap(8),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.all(20).add(
            const EdgeInsets.only(bottom: 9),
          ),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (_, value, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
            child: child,
          );
        },
        child: Material(
          color: Colors.black.withOpacity(0.00),
          child: child,
        ),
      ),
    );
  }
}

class SheetCard extends StatelessWidget {
  const SheetCard({
    super.key,
    this.child,
    this.padding,
    this.height,
    this.color,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            color: color ?? Colors.white,
            width: double.infinity,
            height: height,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        ),
      ),
    );
  }
}
