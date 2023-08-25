import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);

  static PageConfiguration loginPageConfig = const PageConfiguration(
      key: PageKeys.loginPageKey,
      path: PagePaths.loginPagePath,
      uiPage: Pages.loginPage);

  static PageConfiguration signupPageConfig = const PageConfiguration(
      key: PageKeys.signupPageKey,
      path: PagePaths.signupPagePath,
      uiPage: Pages.signupPage);

  static PageConfiguration verificationPageConfig = const PageConfiguration(
      key: PageKeys.verificationPageKey,
      path: PagePaths.verificationPagePath,
      uiPage: Pages.verificationPage);

  static PageConfiguration profilePageConfig = const PageConfiguration(
      key: PageKeys.profilePageKey,
      path: PagePaths.profilePagePath,
      uiPage: Pages.profilePage);

  static PageConfiguration historyPageConfig = const PageConfiguration(
      key: PageKeys.historyPageKey,
      path: PagePaths.historyPagePath,
      uiPage: Pages.historyPage);

  static PageConfiguration dashboardPageConfig = const PageConfiguration(
      key: PageKeys.dashboardPageKey,
      path: PagePaths.dashboardPagePath,
      uiPage: Pages.dashboardPage);

  static PageConfiguration newHistoryPageConfig = const PageConfiguration(
      key: PageKeys.newHistoryPageKey,
      path: PagePaths.newHistoryPagePath,
      uiPage: Pages.newHistory);

  static PageConfiguration mapsScreenPageConfig = const PageConfiguration(
      key: PageKeys.mapScreenPageKey,
      path: PagePaths.mapsScreenPagePath,
      uiPage: Pages.mapsScreen);
}
