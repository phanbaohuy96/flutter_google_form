import 'dart:math';

import 'package:core/core.dart';
import 'package:dartx/dartx.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/form.dart';
import '../../../../../extentions/extention.dart';
import '../form_element_response_widget.dart';
import '../form_element_widget.dart';

/// Customization
class FormElementRadioWidget extends StatefulWidget {
  const FormElementRadioWidget({
    super.key,
    this.maxOptions = 5,
  });

  final int maxOptions;

  @override
  State<FormElementRadioWidget> createState() => _FormElementRadioWidgetState();
}

class _FormElementRadioWidgetState extends State<FormElementRadioWidget>
    with FormElementStateMixin {
  List<DynamicFormElementMetadata> get optionts => [...?element.metadata];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...optionts.map(_buildOption),
        if (optionts.length < widget.maxOptions && enableToCustomize)
          addOptionButton(),
      ],
    );
  }

  Widget get _prefixWidget => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        width: 18,
        height: 18,
      );

  Widget _buildOption(DynamicFormElementMetadata e) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _prefixWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Builder(
              builder: (context) {
                if (enableToCustomize) {
                  return InputContainer(
                    text: e.lable,
                    withClearButton: false,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    ),
                    onTextChanged: (t) {
                      updateOption(e.copyWith(lable: t));
                    },
                  );
                }
                return Text(e.lable ?? '');
              },
            ),
          ),
          if (enableToCustomize) ...[
            const SizedBox(width: 8),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => removeOption(e),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget addOptionButton() {
    final trans = translate(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _prefixWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: trans.addOption,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        addOption(
                          DynamicFormElementMetadata(
                            lable: '${trans.option} ${optionts.length + 1}',
                          ),
                        );
                      },
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  if (optionts.every(
                    (e) => e.isOther != true,
                  )) ...[
                    TextSpan(text: ' ${trans.or} '),
                    TextSpan(
                      text: '${trans.add} "${trans.other.capitalizeFirst()}"',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          addOption(
                            DynamicFormElementMetadata(
                              lable: trans.other.capitalizeFirst(),
                              isOther: true,
                            ),
                          );
                        },
                    ),
                  ],
                ],
              ),
              style: context.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  void addOption(DynamicFormElementMetadata option) {
    final _options = [
      ...optionts,
      option.copyWith(
        id: const Uuid().v4(),
      ),
    ]..sort(
        /// Sort "other" option as last
        (a, b) => a.isOther == true ? 1 : 0,
      );
    update(
      element.copyWith(
        metadata: _options,
      ),
    );
  }

  void updateOption(DynamicFormElementMetadata option) {
    update(
      element.copyWith(
        metadata: [
          ...optionts.map(
            (e) {
              if (e == option) {
                return option;
              }
              return e;
            },
          ),
        ],
      ),
    );
  }

  void removeOption(DynamicFormElementMetadata option) {
    update(
      element.copyWith(
        metadata: [
          ...optionts.where(
            (e) => e != option,
          ),
        ],
      ),
    );
  }
}

/// Response
class FormElementResponseRadioWidget extends StatefulWidget {
  const FormElementResponseRadioWidget({
    super.key,
    this.maxOptions = 5,
  });

  final int maxOptions;

  @override
  State<FormElementResponseRadioWidget> createState() =>
      _FormElementResponseRadioWidgetState();
}

class _FormElementResponseRadioWidgetState
    extends State<FormElementResponseRadioWidget>
    with FormElementResponseStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...optionts.map(_buildOptions),
      ],
    );
  }

  Widget _buildOptions(DynamicFormElementMetadata option) {
    return RadioListTile<DynamicFormElementMetadata>(
      value: option,
      groupValue: optionts.firstOrNullWhere(
        (e) => e.id == response.optionId,
      ),
      dense: true,
      title: option.isOther == true
          ? Row(
              children: [
                Text(
                  '${option.lable}: ',
                ),
                Expanded(
                  child: InputContainer(
                    text: response.answer,
                    isDense: true,
                    maxLines: null,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    onTextChanged: (p0) {
                      updateResponse(
                        element,
                        response.copyWith(
                          answer: p0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Text.rich(
              TextSpan(
                text: option.lable,
              ),
            ),
      splashRadius: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (DynamicFormElementMetadata? value) {
        updateResponse(
          element,
          response.copyWith(
            optionId: value?.id,
            answer: null,
          ),
        );
      },
    );
  }
}

/// Statistic

class FormElementResponseStatisticsRadioWidget extends StatefulWidget {
  const FormElementResponseStatisticsRadioWidget({
    super.key,
    required this.element,
    required this.responses,
  });

  final DynamicFormElement element;
  final List<DynamicFormResponse> responses;

  @override
  State<FormElementResponseStatisticsRadioWidget> createState() =>
      _FormElementResponseStatisticsRadioWidgetState();
}

class _FormElementResponseStatisticsRadioWidgetState
    extends State<FormElementResponseStatisticsRadioWidget> {
  final optionsColorMapper = <DynamicFormElementMetadata, Color>{};
  int touchedIndex = -1;
  Map<DynamicFormElementMetadata?, List<DynamicFormResponse>> data =
      <DynamicFormElementMetadata?, List<DynamicFormResponse>>{};

  @override
  void initState() {
    _setUpData();
    super.initState();
  }

  @override
  void didUpdateWidget(
    covariant FormElementResponseStatisticsRadioWidget oldWidget,
  ) {
    _setUpData();
    super.didUpdateWidget(oldWidget);
  }

  void _setUpData() {
    final options = [...?widget.element.metadata];
    optionsColorMapper
      ..clear()
      ..addEntries(
        options.mapIndex(
          (e, i) {
            return MapEntry(e, Colors.primaries[i % Colors.primaries.length]);
          },
        ),
      );
    data = widget.responses.groupBy<DynamicFormElementMetadata?>(
      (res) => options.firstOrNullWhere(
        (e) => e.id == res.optionId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final trans = translate(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          widget.element.title ?? trans.untitled,
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          '${widget.responses.length} ${trans.responses.toLowerCase()}',
          style: textTheme.labelMedium,
        ),
        if (widget.responses.isNotEmpty) ...[
          const SizedBox(
            height: 8,
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildChart(),
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ...optionsColorMapper.entries.mapIndex((e, i) {
                      final isTouched = touchedIndex >= 0 &&
                          data.entries.elementAt(touchedIndex).key == e.key;
                      return Text.rich(
                        TextSpan(
                          text: '● ',
                          style: textTheme.bodyMedium?.copyWith(
                            color: e.value,
                          ),
                          children: [
                            TextSpan(
                              text: e.key.lable ?? '',
                              style: textTheme.bodyMedium?.copyWith(
                                color: isTouched ? null : Colors.grey.shade600,
                                fontWeight: isTouched ? FontWeight.bold : null,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  List<PieChartSectionData> showingSections(double radius) {
    return data.entries.mapIndex<PieChartSectionData>(
      (e, i) {
        final isTouched = i == touchedIndex;
        final value = e.value.length.toDouble();
        return PieChartSectionData(
          color: optionsColorMapper[e.key],
          value: e.value.length.toDouble(),
          title: [
            (value / widget.responses.length * 100).toStringAsMaxFixed(2),
            '%',
          ].join(''),
          titlePositionPercentageOffset: 0.55,
          radius: radius,
          titleStyle: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
          borderSide: isTouched
              ? const BorderSide(
                  color: Colors.white,
                  width: 6,
                )
              : BorderSide.none,
        );
      },
    ).toList();
  }

  Widget _buildChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, cons) {
          final radius = min(cons.maxHeight, cons.maxWidth) * 0.45;
          return PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              startDegreeOffset: 180,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 0,
              sections: showingSections(radius),
            ),
          );
        },
      ),
    );
  }
}
