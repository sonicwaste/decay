import 'dart:io';

import 'package:decay/flavors.dart';
import 'package:decay/navigation/navigation.dart';
import 'package:get_it/get_it.dart';

import 'exported_services.dart';
export 'exported_services.dart';

final get = GetIt.instance.get;

Logger get log => get<Logger>();

AppRouter get router => get<AppRouter>();

final _testing = Platform.environment.containsKey('FLUTTER_TEST');

class Services {
  static bool _initialized = false;

  static init(FlavorConfig config) async {
    if (_initialized) return;
    if (_testing) {
      await _initTesting(config);
    } else {
      await _init(config);
    }
    _initialized = true;
  }

  static Future _init(FlavorConfig config) async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<FlavorConfig>(config);

    getIt.registerSingleton(AppRouter());
  }

  static Future _initTesting(FlavorConfig config) async {
    return _init(config); // TODO
  }
}
