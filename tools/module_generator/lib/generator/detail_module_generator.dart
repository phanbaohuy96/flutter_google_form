import '../common/input_helper.dart';
import '../res/templates/detail_module/source.dart';
import 'module_generator_ext.dart';

Future<void> generateDetailModule() async {
  final inputModuleName = await InputHelper.enterName();
  var inputModuleDir = await InputHelper.enterDir();

  await generateModuleWithTemplateSource(
    source: detailModuleRes,
    inputModuleName: '${inputModuleName}_detail',
    inputModuleDir: inputModuleDir,
  );
}
