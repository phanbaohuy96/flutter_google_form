import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class AppEnv extends Env {
  static final AppConfig devEnv = AppConfig(
    envName: Env.devEnvName,
    developmentMode: kDebugMode,
    baseApiLayer: '',
    baseGraphQLUrl: '',
    graphqlSocketUrl: '',
    graphqlApiKey: '',
    onesignalAppID: '',
    app: 'main',
    platformRole: '',
    firebaseApiKey: '',
    firebaseMessagingSenderId: '',
    firebaseProjectId: '',
    firebaseStorageBucket: '',
    firebaseAndroidAppId: '',
    firebaseIOSAppId: '',
  );

  static final AppConfig stagingEnv = AppConfig(
    envName: Env.stagingEnvName,
    developmentMode: kDebugMode,
    baseApiLayer: '',
    baseGraphQLUrl: '',
    graphqlSocketUrl: '',
    graphqlApiKey: '',
    onesignalAppID: '',
    app: 'main',
    platformRole: '',
    firebaseApiKey: '',
    firebaseMessagingSenderId: '',
    firebaseProjectId: '',
    firebaseStorageBucket: '',
    firebaseAndroidAppId: '',
    firebaseIOSAppId: '',
  );

  static final AppConfig prodEnv = AppConfig(
    envName: Env.prodEnvName,
    developmentMode: kDebugMode,
    baseApiLayer: '',
    baseGraphQLUrl: '',
    graphqlSocketUrl: '',
    graphqlApiKey: '',
    onesignalAppID: '',
    app: 'main',
    platformRole: '',
    firebaseApiKey: '',
    firebaseMessagingSenderId: '',
    firebaseProjectId: '',
    firebaseStorageBucket: '',
    firebaseAndroidAppId: '',
    firebaseIOSAppId: '',
  );
}
