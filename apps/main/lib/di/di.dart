import 'package:core/di/core_micro.dart';
import 'package:core/di/core_micro.dart' as core;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

GetIt get injector => core.injector;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
  ],
)
Future<dynamic> configureDependencies({
  required String env,
}) async {
  injector.allowReassignment = true;
  return $initGetIt(injector, environment: env);
}

@module
abstract class AppModule {}
