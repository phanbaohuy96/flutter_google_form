// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/common/constants.dart' as _i965;
import 'package:core/core.dart' as _i494;
import 'package:core/di/core_micro.dart' as _i918;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../common/constants/image_constants.dart' as _i835;
import '../data/data_source/datasource_module.dart' as _i737;
import '../data/data_source/local/local_data_manager.dart' as _i655;
import '../data/data_source/local/preferences_helper/preferences_helper.dart'
    as _i212;
import '../data/data_source/local/sqlite/dao/dynamic_form_dao.dart' as _i385;
import '../data/data_source/local/sqlite/sqlite_database.impl.dart' as _i833;
import '../data/models/form.dart' as _i703;
import '../presentation/modules/form/upsert/bloc/upsert_form_bloc.dart'
    as _i131;
import '../presentation/modules/form/upsert/interactor/upsert_form_interactor.dart'
    as _i523;
import '../presentation/modules/form/upsert/repository/upsert_form_repository.dart'
    as _i631;
import '../presentation/theme/theme_dialog.dart' as _i83;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  await _i918.CorePackageModule().init(gh);
  final appDatasourceModule = _$AppDatasourceModule();
  gh.factory<_i212.PreferencesHelper>(() => _i212.PreferencesHelperImpl());
  gh.singleton<_i965.CoreImageConstant>(() => _i835.ImageConstant());
  gh.factory<_i655.LocalDataManager>(() => _i655.LocalDataManager(
        gh<_i212.PreferencesHelper>(),
        gh<_i494.CorePreferencesHelper>(),
      ));
  gh.factory<_i494.CoreLocalDataManager>(() =>
      appDatasourceModule.coreLocalDataManager(gh<_i655.LocalDataManager>()));
  gh.singleton<_i494.SQLiteDatabase>(() => _i833.SQLiteDatabaseImpl());
  gh.singleton<_i385.DynamicFormDao>(
      () => _i385.DynamicFormDao(gh<_i494.SQLiteDatabase>()));
  gh.factoryParam<_i494.ThemeDialog, _i409.BuildContext, dynamic>((
    context,
    _,
  ) =>
      _i83.AppThemeDialog(context));
  gh.factory<_i631.UpsertFormRepository>(
      () => _i631.UpsertFormRepositoryImpl(gh<_i385.DynamicFormDao>()));
  gh.factory<_i523.UpsertFormInteractor>(
      () => _i523.UpsertFormInteractorImpl(gh<_i631.UpsertFormRepository>()));
  gh.factoryParam<_i131.UpsertFormBloc, _i703.DynamicForm?, dynamic>((
    form,
    _,
  ) =>
      _i131.UpsertFormBloc(
        form,
        gh<_i523.UpsertFormInteractor>(),
      ));
  return getIt;
}

class _$AppDatasourceModule extends _i737.AppDatasourceModule {}