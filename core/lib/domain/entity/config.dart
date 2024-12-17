import '../../common/utils.dart';
import '../../envs.dart';

class Config {
  static final Config instance = Config._();

  Config._();

  AppConfig get appConfig => _appConfig;
  late AppConfig _appConfig;

  // ignore: use_setters_to_change_properties
  void fromConfig(AppConfig config) {
    _appConfig = config;
  }

  static bool get orgIsEmpty => instance.appConfig.graphqlApiKey.isNullOrEmpty;
}

class AppConfig {
  final String envName;
  final bool developmentMode;
  final String baseApiLayer;
  final String baseGraphQLUrl;
  final String graphqlSocketUrl;
  final String graphqlApiKey;
  final String onesignalAppID;
  final String app;
  final String platformRole;
  final String firebaseApiKey;
  final String firebaseMessagingSenderId;
  final String firebaseProjectId;
  final String firebaseStorageBucket;
  final String firebaseAndroidAppId;
  final String firebaseIOSAppId;

  AppConfig({
    required this.envName,
    required this.developmentMode,
    required this.baseApiLayer,
    required this.baseGraphQLUrl,
    required this.onesignalAppID,
    required this.graphqlSocketUrl,
    required this.graphqlApiKey,
    required this.app,
    required this.platformRole,
    required this.firebaseApiKey,
    required this.firebaseMessagingSenderId,
    required this.firebaseProjectId,
    required this.firebaseStorageBucket,
    required this.firebaseAndroidAppId,
    required this.firebaseIOSAppId,
  });

  bool get isDevBuild => envName == Env.devEnvName;

  bool get isStagBuild => envName == Env.stagingEnvName;

  bool get isProdBuild => envName == Env.prodEnvName;

  bool get isDemoBuild => envName == Env.demoEnvName;

  bool get isStaffApp => app == Env.staffAppName;

  bool get isCustomerApp => app == Env.customerAppName;
}
