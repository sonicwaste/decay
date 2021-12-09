import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String sentryDsn;
  final String sentryEnv;

  const FlavorConfig({
    required this.flavor,
    required this.sentryDsn,
    required this.sentryEnv,
  });

  static Future<FlavorConfig> fromEnv(Flavor flavor) async {
    await dotenv.load(fileName: ".env.${flavor.asString()}");
    return FlavorConfig(
      flavor: flavor,
      sentryDsn: dotenv.env['SENTRY_DSN']!,
      sentryEnv: dotenv.env['SENTRY_ENV']!,
    );
  }
}

extension FlavorExts on Flavor {
  String asString() {
    switch (this) {
      case Flavor.dev:
        return 'dev';
      case Flavor.prod:
        return 'prod';
      default:
        throw 'Unexpected flavor $this';
    }
  }
}
