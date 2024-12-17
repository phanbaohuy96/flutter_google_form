import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:yaml/yaml.dart';

import 'common/utils.dart';
import 'generator/generate_app_localizations.dart'
    as generate_app_localizations;

Future<void> generateAppLocalizations() async {
  var filePath = 'l10n.yaml';
  if (!File(filePath).existsSync()) {
    _showYamlError();

    return;
  }

  final yamlMap = loadYaml(File(filePath).readAsStringSync()) as Map;

  final csvPath = yamlMap['resource-file']?.toString() ?? '';
  final outputPath =
      (yamlMap['arb-dir'] is String) ? yamlMap['arb-dir'] : 'assets/languages';

  if (!File(csvPath).existsSync()) {
    printLog('''Localizations csv file is not exist!''');

    return;
  }

  final input = File(csvPath).openRead();

  final fields = await input
      .transform(utf8.decoder)
      .transform(
        CsvToListConverter(
          eol: Platform.isMacOS ? '\n' : defaultEol,
        ),
      )
      .toList();

  final filename = yamlMap['template-arb-file']?.toString() ?? '';
  final fileExtension = filename.split('.').last;
  final filenameTemplate = filename.replaceFirst(filename.split('_').last, '');

  await generate_app_localizations.generateAppLocalizations(
    localizations: fields,
    outputPath: outputPath as String,
    filenameTemplate: filenameTemplate,
    fileExtension: fileExtension,
  );
}

Future<void> generateAppLocalizationsCSVFile() async {
  var filePath = 'l10n.yaml';
  if (!File(filePath).existsSync()) {
    _showYamlError();

    return;
  }

  final yamlMap = loadYaml(File(filePath).readAsStringSync()) as Map;

  final csvPath = yamlMap['resource-file']?.toString() ?? '';
  final filesPath =
      (yamlMap['arb-dir'] is String) ? yamlMap['arb-dir'] : 'assets/languages';

  await generate_app_localizations.generateAppLocalizationsCSvfile(
    filesPath: filesPath as String,
    outputPath: csvPath,
  );
}

void _showYamlError() {
  printLog('''Please setting up an internation­alization for your app first''');
  printLog('''##########################################
##### Reference #####''');
  printLog('''
  https://docs.flutter.dev/development/accessibility-and-localization/internationalization''');
  printLog('##########################################');
}
