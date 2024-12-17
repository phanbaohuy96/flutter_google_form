import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/config.dart';
import 'local/local_data_manager.dart';
import 'remote/app_api_service.dart';
import 'remote/clients/dio_client_factory.dart';
import 'remote/repository/rest_api_repository/rest_api_repository.dart';

@module
abstract class DatasourceModule {
  ///
  /// LOCAL
  ///
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  ///
  /// REMOTE
  ///
  @injectable
  Dio createDioClient(
    CoreLocalDataManager localDataManager,
  ) =>
      DioClientFactory.build(
        localDataManager: localDataManager,
      );

  @injectable
  RestApiRepository restApiRepo(Dio dio) => RestApiRepository(
        dio,
        baseUrl: Config.instance.appConfig.baseApiLayer,
      );

  @injectable
  AppApiService createAppApiService(
    RestApiRepository restApi,
    CoreLocalDataManager localDataManagert,
  ) =>
      AppApiService(restApi, localDataManagert);
}
