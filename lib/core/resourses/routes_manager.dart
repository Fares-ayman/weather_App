import 'package:flutter/material.dart';
import 'package:flutter_template/modules/home/presentation/pages/home_page.dart';
import 'package:flutter_template/modules/home/presentation/pages/search_page.dart';

// make like comments

class AppRoutesName {
  static const String homePage = "home_page";
  static const String searchPage = "search_page";
}

class AppRoute {
  // ignore: body_might_complete_normally_nullable
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case AppRoutesName.searchPage:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: settings,
        );

      /* case AppRoutesName.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case AppRoutesName.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case AppRoutesName.home:
        return MaterialPageRoute(
          builder: (_) => HomePages(),
          settings: settings,
        );
      case AppRoutesName.requestPage:
        final args = settings.arguments as VisitEntity;
        return MaterialPageRoute(
          builder: (_) => RequestsPage(
            visitEntity: args,
          ),
          settings: settings,
        );
      case AppRoutesName.requestInfoPage:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => RequestInfoPage(
            visitEntity: args['visit'],
            requestEntity: args['request'],
          ),
          settings: settings,
        );
      case AppRoutesName.itemsPage:
        final args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => ItemsPage(
            visitEntity: args['visit'],
            requestEntity: args['request'],
          ),
          settings: settings,
        );
      case AppRoutesName.takeActionPage:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => TakeActionPage(
            actionType: args['action'],
            visitEntity: args['visit'],
            requestEntity: args['request'],
            productEntity: args['product'],
            /* uoms: args['uom'],
            variations: args['variations'], */
          ),
          settings: settings,
        );
  */ /* case AppRoutesName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRoutesName.search:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SearchScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRoutesName.detailPhoto:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailPhotoScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case AppRoutesName.favouritePhoto:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const FavouriteScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ); */
    }
  }
}
