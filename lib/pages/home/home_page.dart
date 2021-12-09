import 'dart:math';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decay')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Yoooooooooooukoso'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    DynamicThemeColor.of(context).update(
                      Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                    );
                  },
                  child: const Text('Change color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
