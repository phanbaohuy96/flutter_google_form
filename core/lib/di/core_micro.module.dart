//@GeneratedMicroModule;CorePackageModule;package:core/di/core_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/common/components/event_bus/event_bus.dart' as _i5;
import 'package:core/common/service_module.dart' as _i308;
import 'package:core/common/services/header/providers/env_config_header_provider.dart'
    as _i334;
import 'package:core/common/services/header/providers/language_header_provider.dart'
    as _i67;
import 'package:core/common/services/header/providers/system_header_provider.dart'
    as _i481;
import 'package:core/common/services/header/request_header_service.dart'
    as _i524;
import 'package:core/common/utils/log_utils.dart' as _i1002;
import 'package:core/core.dart' as _i494;
import 'package:core/data/data.dart' as _i1036;
import 'package:core/data/data_source/datasource_module.dart' as _i654;
import 'package:core/data/data_source/local/local_data_manager.dart' as _i382;
import 'package:core/data/data_source/local/preferences_helper/preferences_helper.dart'
    as _i289;
import 'package:core/data/data_source/remote/app_api_service.dart' as _i841;
import 'package:core/data/data_source/remote/repository/rest_api_repository/rest_api_repository.dart'
    as _i908;
import 'package:core/presentation/common_bloc/app_bloc/app_bloc.dart' as _i204;
import 'package:core/presentation/theme/theme_dialog.dart' as _i288;
import 'package:dio/dio.dart' as _i361;
import 'package:event_bus/event_bus.dart' as _i1017;
import 'package:fl_utils/fl_utils.dart' as _i417;
import 'package:flutter/cupertino.dart' as _i719;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _Demo = 'Demo';
const String _Staging = 'Staging';
const String _Production = 'Production';
const String _Development = 'Development';

class CorePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final eventBusModule = _$EventBusModule();
    final datasourceModule = _$DatasourceModule();
    final logUtilsModule = _$LogUtilsModule();
    final serviceModule = _$ServiceModule();
    gh.factory<_i1017.EventBus>(() => eventBusModule.eventBus);
    gh.factory<_i334.AppConfigHeaderProvider>(
        () => _i334.AppConfigHeaderProvider());
    gh.factory<_i481.SystemHeaderProvider>(() => _i481.SystemHeaderProvider());
    gh.singleton<_i5.EventBusManager>(() => eventBusModule.manager);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => datasourceModule.prefs,
      preResolve: true,
    );
    gh.factory<_i417.LogUtils>(
      () => logUtilsModule.prodLogUlils,
      registerFor: {
        _Demo,
        _Staging,
        _Production,
      },
    );
    gh.factory<_i289.CorePreferencesHelper>(
        () => _i289.CorePreferencesHelperImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i417.LogUtils>(
      () => logUtilsModule.devLogUlils,
      registerFor: {_Development},
    );
    gh.factory<_i382.CoreLocalDataManager>(
        () => _i382.CoreLocalDataManager(gh<_i289.CorePreferencesHelper>()));
    gh.factoryParam<_i204.AppGlobalBloc, _i204.AppGlobalState, dynamic>((
      appData,
      _,
    ) =>
        _i204.AppGlobalBloc.injectable(
          appData: appData,
          ldm: gh<_i494.CoreLocalDataManager>(),
        ));
    gh.factory<_i67.LanguageHeaderProvider>(
        () => _i67.LanguageHeaderProvider(gh<_i1036.CoreLocalDataManager>()));
    gh.factory<_i361.Dio>(() =>
        datasourceModule.createDioClient(gh<_i382.CoreLocalDataManager>()));
    gh.factoryParam<_i288.ThemeDialog, _i719.BuildContext, dynamic>((
      context,
      _,
    ) =>
        _i288.CoreThemeDialog(context));
    gh.factory<_i908.RestApiRepository>(
        () => datasourceModule.restApiRepo(gh<_i361.Dio>()));
    gh.lazySingleton<_i524.RequestHeaderService>(
        () => serviceModule.requestHeaderService(
              gh<_i524.AppConfigHeaderProvider>(),
              gh<_i524.LanguageHeaderProvider>(),
              gh<_i524.SystemHeaderProvider>(),
            ));
    gh.factory<_i841.AppApiService>(() => datasourceModule.createAppApiService(
          gh<_i908.RestApiRepository>(),
          gh<_i382.CoreLocalDataManager>(),
        ));
  }
}

class _$EventBusModule extends _i5.EventBusModule {}

class _$DatasourceModule extends _i654.DatasourceModule {}

class _$LogUtilsModule extends _i1002.LogUtilsModule {}

class _$ServiceModule extends _i308.ServiceModule {}
