import 'package:flutter/material.dart';

import '../../../../common/utils.dart';
import '../../../theme/export.dart';
import '../../title_widget.dart';

part 'dropdown_controller.dart';

class DropdownWidget<T> extends StatefulWidget {
  final String? title;
  final bool required;
  final T? initial;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String? hint;
  final Widget Function(T) itemBuilder;
  final DropdownController<T, DropdownData<T>>? controller;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? prefixIconPadding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? iconColor;
  final Widget? suffixIcon;
  final bool showBorder;
  final TextStyle? hintStyle;
  final BorderSide? borderSide;
  final BorderSide? focusedBorderSide;
  final double menuMaxHeight;
  final bool enable;
  final Color? fillColor;
  final bool isDense;
  final bool isExpanded;
  final Widget Function(T)? selectedItemBuilder;

  DropdownWidget({
    this.title,
    required this.itemBuilder,
    required this.items,
    this.initial,
    this.controller,
    this.onChanged,
    this.hint,
    this.required = false,
    this.prefixIcon,
    this.prefixIconPadding,
    this.iconColor,
    this.suffixIcon,
    this.contentPadding,
    this.showBorder = true,
    this.hintStyle,
    this.borderSide,
    this.focusedBorderSide,
    this.menuMaxHeight = 500,
    this.enable = true,
    this.fillColor,
    this.isDense = true,
    this.isExpanded = true,
    this.selectedItemBuilder,
  });

  @override
  State<DropdownWidget<T>> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>> {
  bool get hasPrefixIcon => widget.prefixIcon != null;

  double get prefixIconSize => hasPrefixIcon ? 16 : 0;

  DropdownController<T, DropdownData<T>>? _controller;

  @override
  void initState() {
    _setupController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DropdownWidget<T> oldWidget) {
    _setupController();
    super.didUpdateWidget(oldWidget);
  }

  void _setupController() {
    _controller = widget.controller ??
        _controller ??
        DropdownController<T, DropdownData<T>>(
          value: DropdownData<T>(),
        );
    if (widget.initial != null &&
        _controller!.data != widget.initial &&
        widget.items.any((e) => e == widget.initial)) {
      _controller!.setData(widget.initial);
    }
    if (!widget.items.any((e) => e == _controller!.data)) {
      _controller!.setData(null);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller?.dispose();
      _controller = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: _titleText(themeData.textTheme),
          ),
        ValueListenableBuilder<DropdownData<T>>(
          valueListenable: _controller!,
          builder: (ctx, value, w) {
            final body = DropdownButtonFormField<T>(
              menuMaxHeight: widget.menuMaxHeight,
              value: value.value,
              items: widget.items.map((e) {
                return DropdownMenuItem<T>(
                  value: e,
                  child: widget.itemBuilder(e),
                );
              }).toList(),
              selectedItemBuilder: widget.selectedItemBuilder != null
                  ? (context) => widget.items
                      .map((e) => widget.selectedItemBuilder!(e))
                      .toList()
                  : null,
              onChanged: !widget.enable
                  ? null
                  : (value) {
                      _controller!.setData(value);
                      widget.onChanged?.call(value);
                    },
              iconSize: 24,
              icon: !widget.enable
                  ? const SizedBox()
                  : widget.suffixIcon ??
                      Icon(
                        Icons.keyboard_arrow_down,
                        color:
                            widget.iconColor ?? context.themeColor.schemeAction,
                      ),
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.hint ?? '',
                  style: widget.hintStyle ?? context.textTheme.inputHint,
                ),
              ),
              style: context.textTheme.textInput,
              isExpanded: widget.isExpanded,
              isDense: widget.isDense,
              decoration: InputDecoration(
                errorText: value.validation,
                errorStyle: themeData.textTheme.titleMedium,
                prefixIcon: _getPrefixIcon(),
                prefixIconConstraints: BoxConstraints(
                  minHeight: prefixIconSize,
                  minWidth: prefixIconSize,
                ),
                contentPadding: widget.contentPadding,
                filled: !widget.enable || widget.fillColor != null,
                fillColor: widget.enable ? widget.fillColor : null,
              ),
            );

            final inputDecorationTheme = themeData.inputDecorationTheme;
            return Theme(
              data: themeData.copyWith(
                primaryColor: themeData.colorScheme.secondary,
                primaryColorDark: themeData.colorScheme.secondary,
                inputDecorationTheme: InputDecorationTheme(
                  border: !widget.showBorder
                      ? InputBorder.none
                      : inputDecorationTheme.border
                          ?.copyWith(borderSide: widget.borderSide),
                  enabledBorder: !widget.showBorder
                      ? InputBorder.none
                      : inputDecorationTheme.enabledBorder
                          ?.copyWith(borderSide: widget.borderSide),
                  focusedBorder: !widget.showBorder
                      ? InputBorder.none
                      : inputDecorationTheme.focusedBorder
                          ?.copyWith(borderSide: widget.focusedBorderSide),
                  contentPadding: widget.contentPadding ??
                      themeData.inputDecorationTheme.contentPadding,
                ),
              ),
              child: body,
            );
          },
        ),
      ],
    );
  }

  Widget _titleText(TextTheme textTheme) {
    return InputTitleWidget(
      title: widget.title,
      required: widget.required,
    );
  }

  Widget? _getPrefixIcon() {
    return widget.prefixIcon?.let(
      (icon) => Padding(
        padding: widget.prefixIconPadding ??
            EdgeInsets.symmetric(horizontal: prefixIconSize),
        child: icon,
      ),
    );
  }
}
