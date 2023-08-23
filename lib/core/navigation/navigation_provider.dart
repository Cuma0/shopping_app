// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/view/cart_page_view.dart';

import '../../view/bookmarks_page_view.dart';
import '../../view/cashback_page_view.dart';
import '../../view/home_page_view.dart';
import '../../view/profile_page_view.dart';
import '../components/bottom_navigation_bar/screen_model.dart';
import '../components/bottom_navigation_bar/screen_view.dart';
import 'navigation_constants.dart';

const HOME_PAGE_VIEW = 0;
const SEARCH_PAGE_VIEW = 1;
const BOOKMARKS_PAGE_VIEW = 2;
const PROFILE_PAGE_VIEW = 3;

class NavigationProvider extends ChangeNotifier {
  static final NavigationProvider _instance = NavigationProvider._init();
  static NavigationProvider get instance => _instance;
  NavigationProvider._init();

  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  int _currentViewIndex = HOME_PAGE_VIEW;

  int get currentTabIndex => _currentViewIndex;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.SCREEN_VIEW:
        return _normalNavigate(const ScreenView());
      case NavigationConstants.CART_PAGE_VIEW:
        return _fullScreenDialogNavigate(const CartPageView());

      default:
        return MaterialPageRoute(builder: (_) => const ScreenView());
    }
  }

  final Map<int, Screen> _screens = {
    HOME_PAGE_VIEW: Screen(
      title: 'Home',
      child: const HomePageView(),
      initialRoute: NavigationConstants.HOME_PAGE_VIEW,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings args) {
        switch (args.name) {
          default:
            return NavigationProvider._instance
                ._normalNavigate(const HomePageView());
        }
      },
      scrollController: ScrollController(),
    ),
    SEARCH_PAGE_VIEW: Screen(
      title: 'Search',
      child: const CashbackPageView(),
      initialRoute: NavigationConstants.CASHBACK_PAGE_VIEW,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings args) {
        switch (args.name) {
          default:
            return NavigationProvider._instance
                ._normalNavigate(const CashbackPageView());
        }
      },
      scrollController: ScrollController(),
    ),
    BOOKMARKS_PAGE_VIEW: Screen(
      title: 'Bookmarks',
      child: const BookmarksPageView(),
      initialRoute: NavigationConstants.BOOKMARKS_PAGE_VIEW,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings args) {
        //  print('Generating route: ${args.name}');
        switch (args.name) {
          default:
            return NavigationProvider._instance
                ._normalNavigate(const BookmarksPageView());
        }
      },
      scrollController: ScrollController(),
    ),
    PROFILE_PAGE_VIEW: Screen(
      title: 'Profile',
      child: const ProfilePageView(),
      initialRoute: NavigationConstants.PROFILE_PAGE_VIEW,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (RouteSettings args) {
        //   print('Generating route: ${args.name}');

        switch (args.name) {
          default:
            return NavigationProvider._instance
                ._normalNavigate(const ProfilePageView());
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen? get currentView => _screens[_currentViewIndex];

  /// Set currently visible tab.
  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    } else {
      _currentViewIndex = tab;
      notifyListeners();
    }
  }

  /// If currently displayed screen has given [ScrollController] animate it
  /// to the start of scroll view.
  void _scrollToStart() {
    if (currentView!.scrollController != null &&
        currentView!.scrollController!.hasClients) {
      currentView!.scrollController!.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Provide this to [WillPopScope] callback.
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentView!.navigatorState.currentState;

    if (currentNavigatorState!.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != HOME_PAGE_VIEW) {
        setTab(HOME_PAGE_VIEW);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => Container(),
        );
      }
    }
  }

  MaterialPageRoute _fullScreenDialogNavigate(Widget widget) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => widget,
    );
  }

  MaterialPageRoute _normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
