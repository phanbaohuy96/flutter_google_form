import 'package:flutter/material.dart';

import '../../../../core.dart';

part 'multiple_choice_dropdown_controller.dart';

class MultipleChoiceDropdownWidget<T> extends StatefulWidget {
  final String? title;
  final bool required;
  final List<T> items;
  final void Function(List<T>)? onChanged;
  final String? hint;
  final Widget Function(T, bool selected) itemBuilder;
  final Widget Function(List<T>) valueBuilder;
  final MultipleChoiceDropdownController<T, MultipleChoiceDropdownData<T>>
      controller;
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
  final String? description;
  final bool showClearButton;
  final VoidCallback? onClear;

  /// Default using [AppTextTheme.inputError]
  final TextStyle? errorStyle;

  MultipleChoiceDropdownWidget({
    this.title,
    required this.controller,
    required this.itemBuilder,
    required this.valueBuilder,
    required this.items,
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
    this.description,
    this.showClearButton = true,
    this.onClear,
    this.errorStyle,
  });

  @override
  State<MultipleChoiceDropdownWidget<T>> createState() =>
      _MultipleChoiceDropdownWidgetState<T>();
}

class _MultipleChoiceDropdownWidgetState<T>
    extends State<MultipleChoiceDropdownWidget<T>> {
  bool get hasPrefixIcon => widget.prefixIcon != null;

  double get prefixIconSize => hasPrefixIcon ? 16 : 0;

  Size? childSize;

  Widget _buildSuffixIcon(MultipleChoiceDropdownData<T> value) {
    if (!widget.enable) {
      return const SizedBox();
    }
    if (widget.showClearButton && value.value.isNotEmpty) {
      return IconButton(
        icon: Icon(
          Icons.clear,
          color: widget.iconColor ?? context.themeColor.schemeAction,
        ),
        onPressed: () {
          widget.controller.setData([]);
          widget.onClear?.call();
          widget.onChanged?.call([]);
        },
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        iconSize: 20,
        splashRadius: 20,
      );
    }

    return widget.suffixIcon ??
        Icon(
          Icons.keyboard_arrow_down,
          color: widget.iconColor ?? context.themeColor.schemeAction,
        );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: _titleText(themeData.textTheme),
          ),
        ValueListenableBuilder<MultipleChoiceDropdownData<T>>(
          valueListenable: widget.controller,
          builder: (ctx, value, w) {
            final body = DropdownButtonFormField<T>(
              menuMaxHeight: widget.menuMaxHeight,
              value: value.value.firstOrNull,
              items: widget.items.map((e) {
                return DropdownMenuItem<T>(
                  value: e,
                  child: _DropDownMenuBox(
                    item: e,
                    itemBuilder: widget.itemBuilder,
                    selected: value.value.any((i) => i == e),
                    onChanged: (selected) {
                      if (!selected) {
                        widget.controller.setData([
                          ...widget.controller.data.where((i) => i != e),
                        ]);
                      } else {
                        widget.controller.setData([
                          ...widget.controller.data,
                          e,
                        ]);
                      }
                      widget.onChanged?.call(widget.controller.data);
                    },
                  ),
                );
              }).toList(),
              selectedItemBuilder: (context) => [
                ...widget.items.map((_) => const SizedBox()),
              ],
              isDense: value.value.isEmpty,
              isExpanded: true,
              onChanged: !widget.enable ? null : (_) {},
              iconSize: 24,
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.hint ?? '',
                  style: widget.hintStyle ?? textTheme.inputHint,
                ),
              ),
              icon: _buildSuffixIcon(value),
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                filled: !widget.enable || widget.fillColor != null,
                prefixIcon: _getPrefixIcon(),
                prefixIconConstraints: BoxConstraints(
                  minHeight: prefixIconSize,
                  minWidth: prefixIconSize,
                ),
                contentPadding: widget.contentPadding,
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
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 48),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: widget.contentPadding ??
                          themeData.inputDecorationTheme.contentPadding ??
                          EdgeInsets.zero,
                      child: MeasureSize(
                        onChange: (size) {
                          if (childSize == null ||
                              childSize!.height != size.height) {
                            setState(() {
                              childSize = size;
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: hasPrefixIcon ? prefixIconSize : 0,
                            right: 24,
                          ),
                          child: widget.valueBuilder(value.value),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: body,
                  ),
                ],
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (context, value, child) {
            if (value.validation.isNotNullOrEmpty) {
              return Padding(
                padding: const EdgeInsets.only(left: 4, top: 4),
                child: Text(
                  value.validation!,
                  style: widget.errorStyle ?? textTheme.inputError,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _titleText(TextTheme textTheme) {
    return Row(
      children: [
        Flexible(
          child: InputTitleWidget(
            title: widget.title,
            required: widget.required,
          ),
        ),
        if (widget.description.isNotNullOrEmpty) ...[
          const SizedBox(
            width: 4,
          ),
          Tooltip(
            message: widget.description,
            triggerMode: TooltipTriggerMode.tap,
            child: const Icon(
              Icons.info_outline,
              size: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ],
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

class _DropDownMenuBox<T> extends StatefulWidget {
  final T item;
  final bool selected;
  final Function(bool selected) onChanged;
  final Widget Function(T, bool selected) itemBuilder;

  const _DropDownMenuBox({
    super.key,
    required this.item,
    required this.selected,
    required this.onChanged,
    required this.itemBuilder,
  });

  @override
  State<_DropDownMenuBox<T>> createState() => _DropDownMenuBoxState<T>();
}

class _DropDownMenuBoxState<T> extends State<_DropDownMenuBox<T>> {
  bool selected = false;
  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _DropDownMenuBox<T> oldWidget) {
    selected = widget.selected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
        widget.onChanged.call(selected);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: widget.itemBuilder(widget.item, selected),
      ),
    );
  }
}
