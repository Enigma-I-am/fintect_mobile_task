import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseScaffold extends HookConsumerWidget {
  const BaseScaffold({
    super.key,
    this.bgWidget,
    this.children = const [],
    this.flexibleChildren = const [],
    this.bottomSheet,
    this.bottomButton,
    this.bottomWidgetAlignment = Alignment.bottomCenter,
    this.backgroundColor,
    this.headerWidget,
    this.child,
    this.padding,
  });
  final Widget? child;
  final Widget? bgWidget, headerWidget;
  final List<Widget> children, flexibleChildren;
  final Widget? bottomSheet, bottomButton;
  final AlignmentGeometry bottomWidgetAlignment;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // bottomSheet: ,

      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          if (bgWidget != null) ...[
            bgWidget!,
          ],
          child ??
              // else
              SafeArea(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // header widget
                      if (headerWidget != null) ...[
                        headerWidget!,
                      ],
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (children.isNotEmpty) ...children,
                            if (flexibleChildren.isNotEmpty)
                              Flexible(
                                child: ListView(children: flexibleChildren),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Align(
            alignment: bottomWidgetAlignment,
            child: bottomSheet ?? (bottomButton ?? const Offstage()),
          ),
          // if (child != null)
        ],
      ),
    );
  }
}
