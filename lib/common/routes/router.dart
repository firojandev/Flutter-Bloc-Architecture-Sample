import 'package:edcr_sup_flutter/common/routes/route_path.dart';
import 'package:edcr_sup_flutter/features/auth/login_page.dart';
import 'package:edcr_sup_flutter/features/dashboard/dashboard_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: RoutePath.login, routes: [
  GoRoute(
      path: RoutePath.login,
      name: RoutePath.login,
      builder: (context, state) => LoginPage()),
  GoRoute(
      path: RoutePath.dashboard,
      name: RoutePath.dashboard,
      builder: (context, state) => DashboardPage()),
]);
