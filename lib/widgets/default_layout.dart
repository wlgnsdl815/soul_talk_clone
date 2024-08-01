import 'package:flutter/material.dart';
import 'package:soul_talk_clone/widgets/fly_light.dart';

class DefaultLayout extends StatelessWidget {
  final Widget? bottomNavigationBar;
  final Widget body;
  final PreferredSizeWidget? appBar;

  const DefaultLayout({
    super.key,
    this.bottomNavigationBar,
    required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: FlyLight(
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
