import 'package:decay/services/sentry.dart';
import 'package:decay/services/services.dart';
import 'package:decay/utils/hive_utils.dart';
import 'package:flutter/foundation.dart';

import 'app.dart';
import 'flavors.dart';

Future init(Flavor flavor) async {
  await Executor().warmUp(log: kDebugMode);
  await HiveUtils.init();
  final config = await Config.fromEnv(flavor);
  await Services.init(config);
  await runAppWithSentry(config, const App());
}
