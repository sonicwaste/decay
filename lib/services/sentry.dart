import 'package:decay/flavors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future runAppWithSentry(Config config, Widget app) {
  return SentryFlutter.init(
    (options) {
      options.dsn = kDebugMode ? '' : config.sentryDsn;
      options.environment = config.sentryEnv;
      options.diagnosticLevel = SentryLevel.error;
      options.sampleRate = 1.0;
    },
    appRunner: () => runApp(app),
  );
}
