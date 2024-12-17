import 'dart:async';
import 'dart:convert';

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/form.dart';
import '../../../../models/user.dart';
import '../data_access_object.dart';

@Singleton()
class DynamicFormResponseDao extends DAO {
  DynamicFormResponseDao(super.db);

  DataColumn get idClm =>
      DataColumn(name: 'id', type: DataType.text, isPrimary: true);
  DataColumn get elementIdClm =>
      DataColumn(name: 'element_id', type: DataType.text);
  DataColumn get formIdClm => DataColumn(name: 'form_id', type: DataType.text);
  DataColumn get optionIdClm =>
      DataColumn(name: 'option_id', type: DataType.text);
  DataColumn get answerClm => DataColumn(name: 'answer', type: DataType.text);
  DataColumn get createdAtClm =>
      DataColumn(name: 'created_at', type: DataType.text);
  DataColumn get createdUserClm =>
      DataColumn(name: 'created_user', type: DataType.text);

  @override
  List<DataColumn> get columns => [
        idClm,
        elementIdClm,
        formIdClm,
        optionIdClm,
        answerClm,
        createdAtClm,
        createdUserClm,
      ];

  @override
  String get tableName => SqliteTable.formResponse.name;

  Future<List<DynamicFormResponse>> get({
    (String where, List<dynamic> args)? whereOption,
    int? limit,
    int? offset,
  }) {
    return execute<List<DynamicFormResponse>>(() async {
      final maps = await db.query(
        tableName,
        columns: columnsWhere,
        where: whereOption?.$1.let(
          (where) => where.isNotEmpty ? where : null,
        ),
        whereArgs: whereOption?.$2.let(
          (args) => args.isNotEmpty ? args : null,
        ),
        limit: limit,
        offset: offset,
        orderBy: '${createdAtClm.name} DESC',
      );

      if (maps.isEmpty) {
        return [];
      }

      return [...maps.map(toObject)];
    });
  }

  Future<bool> upsert(
    DynamicFormResponse form,
  ) async {
    logUtils.d(form.toJson(), '$runtimeType upsert');
    return execute<bool>(() async {
      final result = await db.insert(
        tableName,
        toMap(form),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return result > 0;
    });
  }

  Future<bool> clear() {
    return execute<bool>(() async {
      final result = await db.delete(tableName);

      return result > 0;
    });
  }

  Map<String, Object?> toMap(
    DynamicFormResponse form,
  ) {
    return {
      idClm.name: form.id,
      elementIdClm.name: form.elementId,
      formIdClm.name: form.formId,
      optionIdClm.name: form.optionId,
      answerClm.name: form.answer,
      createdAtClm.name: form.createdAt != null
          ? jsonEncode(
              form.createdAt!.toIso8601String(),
            )
          : null,
      createdUserClm.name: form.createdUser != null
          ? jsonEncode(
              form.createdUser!.toJson(),
            )
          : null,
    };
  }

  DynamicFormResponse toObject(Map<String, Object?> data) {
    return DynamicFormResponse(
      id: asOrNull<String>(data[idClm.name]),
      elementId: asOrNull<String>(data[elementIdClm.name]),
      optionId: asOrNull<String>(data[optionIdClm.name]),
      formId: asOrNull<String>(data[formIdClm.name]),
      answer: asOrNull<String>(data[answerClm.name]),
      createdAt: asOrNull(data[createdAtClm.name]) ?? DateTime.now(),
      createdUser: User.fromJson(
        jsonDecode(asOrNull<String>(data[createdUserClm.name]) ?? '{}'),
      ),
    );
  }
}
