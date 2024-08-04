import 'package:flutter/material.dart';

import 'package:soul_talk_clone/widgets/fly_light.dart';

class DefaultLayout extends StatelessWidget {
  final Widget? bottomNavigationBar;
  final Widget body;
  final bool? hasAppBar;
  final PreferredSizeWidget? appBar;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final bool? isAppBarTitleCenter;
  final GestureTapCallback? onTap;
  final PreferredSizeWidget? appBarBottom;
  final bool? hasSafeArea;

  const DefaultLayout({
    super.key,
    this.bottomNavigationBar,
    required this.body,
    this.hasAppBar = false,
    this.appBar,
    this.appBarTitle,
    this.appBarActions,
    this.isAppBarTitleCenter = true,
    this.onTap,
    this.appBarBottom,
    this.hasSafeArea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar == false
          ? null
          : AppBar(
              centerTitle: isAppBarTitleCenter,
              elevation: 0,
              title: appBarTitle != null ? Text(appBarTitle!) : null,
              leading: GestureDetector(
                onTap: onTap,
                behavior: HitTestBehavior.opaque,
              ),
              actions: appBarActions,
              bottom: appBarBottom,
            ),
      body: FlyLight(
        hasSafeArea: hasSafeArea,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
