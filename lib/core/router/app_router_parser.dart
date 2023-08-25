import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class AppRouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.mapsScreenPageConfig);
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case PagePaths.splashPagePath:
        return SynchronousFuture(PageConfigs.splashPageConfig);
      default:
        return SynchronousFuture(PageConfigs.splashPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);

      case Pages.loginPage:
        return const RouteInformation(location: PagePaths.loginPagePath);

      case Pages.signupPage:
        return const RouteInformation(location: PagePaths.signupPagePath);

      case Pages.verificationPage:
        return const RouteInformation(location: PagePaths.verificationPagePath);

      case Pages.profilePage:
        return const RouteInformation(location: PagePaths.profilePagePath);

      case Pages.historyPage:
        return const RouteInformation(location: PagePaths.historyPagePath);

      case Pages.dashboardPage:
        return const RouteInformation(location: PagePaths.dashboardPagePath);

      case Pages.newHistory:
        return const RouteInformation(location: PagePaths.newHistoryPagePath);
        case Pages.mapsScreen:
        return const RouteInformation(location: PagePaths.mapsScreenPagePath);
    }
  }
}
