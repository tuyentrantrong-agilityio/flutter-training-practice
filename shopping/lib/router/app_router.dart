import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          path: '/sign_up',
          page: SignUpRoute.page,
        ),
        AutoRoute(
          path: '/login',
          page: LogInRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
      ];
}
