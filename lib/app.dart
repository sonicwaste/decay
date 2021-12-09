import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:decay/services/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicThemeColor(
      notifier: DynamicThemeColorChangeNotifier()..color = Colors.teal,
      child: ColorSetsProvider(
        builder: (context, colorSets, _) {
          return MaterialApp.router(
            title: 'decay',
            theme: DynamicTheme.withColorSet(Brightness.light, colorSets.light),
            darkTheme:
                DynamicTheme.withColorSet(Brightness.dark, colorSets.dark),
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
