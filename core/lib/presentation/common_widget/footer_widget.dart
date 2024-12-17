import 'dart:math';

import 'package:flutter/material.dart';

import '../extentions/context_extention.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    Key? key,
    required this.child,
    this.alignment,
    this.paddingBottom,
    this.showdow = true,
  }) : super(key: key);

  final Widget child;
  final AlignmentGeometry? alignment;
  final double? paddingBottom;
  final bool showdow;

  @override
  Widget build(BuildContext context) {
    final _paddingBottom =
        paddingBottom ?? MediaQuery.of(context).padding.bottom;
    final themeColor = context.themeColor;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeColor.themePrimary,
        boxShadow: showdow ? themeColor.boxShadowLight : null,
      ),
      padding: EdgeInsets.only(
        bottom: max(_paddingBottom, 16),
        right: 16,
        left: 16,
        top: 16,
      ),
      alignment: alignment,
      child: child,
    );
  }
}
