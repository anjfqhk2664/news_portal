import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:news_portal/presentation/login/login_screen.dart';
import 'package:news_portal/presentation/main_list/news_list_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoute.login.path,
  routes: [
    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.newsList.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: AppRoute.newsList.path,
      name: AppRoute.newsList.name,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: NewsListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

enum AppRoute { login, newsList }

extension AppRouteExtension on AppRoute {
  String get path => '/$this';
}
