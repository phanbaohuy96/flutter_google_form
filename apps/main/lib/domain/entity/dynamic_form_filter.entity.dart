// ignore_for_file: invalid_annotation_target

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dynamic_form_filter.entity.freezed.dart';

@freezed
class DynamicFormFilter with _$DynamicFormFilter {
  const factory DynamicFormFilter({
    final String? id,
    final DateRange? timeRange,
  }) = _DynamicFormFilter;

  const DynamicFormFilter._();

  bool get isDefault => [
        id == null,
        timeRange?.from == null,
        timeRange?.to == null,
      ].every(
        (e) => e,
      );

  String get sqliteWhere => [
        if (id.isNotNullOrEmpty) 'id = ?',
        if (timeRange?.from != null) 'created_at >= ?',
        if (timeRange?.to != null) 'created_at <= ?',
      ].join(' AND ');

  List<String> get sqliteWhereArgs => [
        if (id.isNotNullOrEmpty) id!,
        if (timeRange?.from != null) timeRange!.from!.toIso8601String(),
        if (timeRange?.to != null) timeRange!.to!.toIso8601String(),
      ];
}

@freezed
class DynamicFormResponseFilter with _$DynamicFormResponseFilter {
  const factory DynamicFormResponseFilter({
    final String? elementId,
    final String? formId,
    final String? optionId,
    final DateRange? timeRange,
  }) = _DynamicFormResponseFilter;

  const DynamicFormResponseFilter._();

  bool get isDefault => [
        elementId == null,
        formId == null,
        optionId == null,
        timeRange?.from == null,
        timeRange?.to == null,
      ].every(
        (e) => e,
      );

  String get sqliteWhere => [
        if (elementId.isNotNullOrEmpty) 'element_id = ?',
        if (formId.isNotNullOrEmpty) 'form_id = ?',
        if (optionId.isNotNullOrEmpty) 'option_id = ?',
        if (timeRange?.from != null) 'created_at >= ?',
        if (timeRange?.to != null) 'created_at <= ?',
      ].join(' AND ');

  List<String> get sqliteWhereArgs => [
        if (elementId.isNotNullOrEmpty) elementId!,
        if (formId.isNotNullOrEmpty) formId!,
        if (optionId.isNotNullOrEmpty) optionId!,
        if (timeRange?.from != null) timeRange!.from!.toIso8601String(),
        if (timeRange?.to != null) timeRange!.to!.toIso8601String(),
      ];
}
