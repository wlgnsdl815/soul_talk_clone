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

  const DefaultLayout({
    super.key,
    this.bottomNavigationBar,
    required this.body,
    this.appBar,
    this.hasAppBar = false,
    this.appBarTitle,
    this.appBarActions,
    this.isAppBarTitleCenter = true,
    this.onTap,
    this.appBarBottom,
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
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
