import 'package:flutter/material.dart';

class SliverSpacing extends StatelessWidget {
  final double amount;

  const SliverSpacing(this.amount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: amount, right: amount),
    );
  }
}
