import 'dart:async';
import 'dart:convert';

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/form.dart';
import '../../../../models/user.dart';
import '../data_access_object.dart';

@Singleton()
class DynamicFormDao extends DAO {
  DynamicFormDao(super.db);

  DataColumn get idClm =>
      DataColumn(name: 'id', type: DataType.text, isPrimary: true);
  DataColumn get titleClm => DataColumn(name: 'title', type: DataType.text);
  DataColumn get createdAtClm =>
      DataColumn(name: 'created_at', type: DataType.text);
  DataColumn get metadataClm =>
      DataColumn(name: 'metadata', type: DataType.text);
  DataColumn get createdUserClm =>
      DataColumn(name: 'created_user', type: DataType.text);

  @override
  List<DataColumn> get columns => [
        idClm,
        titleClm,
        createdAtClm,
        metadataClm,
        createdUserClm,
      ];

  @override
  String get tableName => SqliteTable.form.name;

  Future<List<DynamicForm>> get({
    (String where, List<dynamic> args)? whereOption,
    int? limit,
    int? offset,
  }) {
    return execute<List<DynamicForm>>(() async {
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
    DynamicForm form,
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

  Future<bool> delele(String id) {
    return execute<bool>(() async {
      final result = await db.delete(
        tableName,
        where: '${idClm.name} = ?',
        whereArgs: [id],
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
    DynamicForm form,
  ) {
    logUtils.d({
      idClm.name: form.id,
      createdAtClm.name: form.createdAt != null
          ? jsonEncode(
              form.createdAt!.toIso8601String(),
            )
          : null,
      metadataClm.name: jsonEncode([
        ...?form.elements?.map(
          (e) => e.toJson(),
        ),
      ]),
      createdUserClm.name: form.createdUser != null
          ? jsonEncode(
              form.createdUser!.toJson(),
            )
          : null,
    });
    return {
      idClm.name: form.id,
      titleClm.name: form.title,
      createdAtClm.name: form.createdAt != null
          ? jsonEncode(
              form.createdAt!.toIso8601String(),
            )
          : null,
      metadataClm.name: jsonEncode([
        ...?form.elements?.map(
          (e) => e.toJson(),
        ),
      ]),
      createdUserClm.name: form.createdUser != null
          ? jsonEncode(
              form.createdUser!.toJson(),
            )
          : null,
    };
  }

  DynamicForm toObject(Map<String, Object?> data) {
    return DynamicForm(
      id: asOrNull<String>(data[idClm.name])!,
      createdAt: asOrNull(data[createdAtClm.name]) ?? DateTime.now(),
      title: asOrNull<String>(data[titleClm.name]),
      elements:
          (jsonDecode(asOrNull<String>(data[metadataClm.name]) ?? '[]') as List)
              .map(
                (e) => DynamicFormElement.fromJson(e),
              )
              .toList(),
      createdUser: User.fromJson(
        jsonDecode(asOrNull<String>(data[createdUserClm.name]) ?? '{}'),
      ),
    );
  }
}
