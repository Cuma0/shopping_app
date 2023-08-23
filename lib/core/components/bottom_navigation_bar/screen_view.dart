import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/icon_constants.dart';
import '../../navigation/navigation_provider.dart';
import '../../utils/color_scheme.dart';

/// Navigation entry point for app.
class ScreenView extends StatelessWidget {
  // static const route = '/';

  const ScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        // Create bottom navigation bar items from screens.
        final List<BottomNavigationBarItem> bottomNavigationBarItems = [
          BottomNavigationBarItem(
            icon: Icon(
              IconConstants.home,
              color: ColorSchemeLight.instance!.darkGrey,
            ),
            activeIcon: Icon(
              IconConstants.home,
              color: ColorSchemeLight.instance!.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconConstants.coupon,
              color: ColorSchemeLight.instance!.darkGrey,
            ),
            activeIcon: Icon(
              IconConstants.coupon,
              color: ColorSchemeLight.instance!.black,
            ),
            label: "Cashback",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconConstants.bookmark,
              color: ColorSchemeLight.instance!.darkGrey,
            ),
            activeIcon: Icon(
              IconConstants.bookmark,
              color: ColorSchemeLight.instance!.black,
            ),
            label: "Bookmarks",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconConstants.profile,
              color: ColorSchemeLight.instance!.darkGrey,
            ),
            activeIcon: Icon(
              IconConstants.profile,
              color: ColorSchemeLight.instance!.black,
            ),
            label: "Profile",
          ),
        ];

        // Initialize [Navigator] instance for each screen.
        List<Navigator> screens = provider.screens
            .map(
              (screen) => Navigator(
                key: screen.navigatorState,
                onGenerateRoute: screen.onGenerateRoute,
              ),
            )
            .toList();

        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              index: provider.currentTabIndex,
              children: screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
              selectedItemColor: ColorSchemeLight.instance!.black,
            ),
          ),
        );
      },
    );
  }
}
