import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, prod }

class Config {
  final Flavor flavor;
  final String sentryDsn;
  final String sentryEnv;

  const Config({
    required this.flavor,
    required this.sentryDsn,
    required this.sentryEnv,
  });

  static Future<Config> fromEnv(Flavor flavor) async {
    await dotenv.load(fileName: ".env.${flavor.asString()}");
    return Config(
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
