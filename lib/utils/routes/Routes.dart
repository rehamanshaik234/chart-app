import 'package:blyk_leave_management/models/RouteParams.dart';
import 'package:blyk_leave_management/utils/routes/route_observer.dart';
import 'package:blyk_leave_management/views/authentication/login_screen.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/apply_leave.dart';
import 'package:blyk_leave_management/views/main_views/home/home_screen.dart';
import 'package:blyk_leave_management/views/splash_screen/welcome_screen.dart';
import 'package:blyk_leave_management/views/widgets/loading.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:flutter/material.dart';

import 'RouteNames.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings,Function(String?) onPopRoute,RouteParams inputParams) {
    RouteParams params= settings.arguments!=null ? settings.arguments as RouteParams: inputParams;
    print(params.transitionType);
    switch (settings.name) {
      case RoutesName.login:
        return CustomRoute.createRoute(
          page: RouteAwareWidget(
            routeName: RoutesName.login,
            onPop: onPopRoute,
            child: const LoginScreen(),
          ),
          applyAnimation: params.applyAnimation,
          transitionType: params.transitionType,
          settings: settings,
        );
      case RoutesName.welcome:
        return CustomRoute.createRoute(
          page: RouteAwareWidget(
            routeName: RoutesName.welcome,
            onPop: onPopRoute,
            child: const WelcomeScreen(),
          ),
          applyAnimation: params.applyAnimation,
          transitionType: params.transitionType,
          settings: settings,
        );
      case RoutesName.home:
        return CustomRoute.createRoute(
          page: RouteAwareWidget(
            routeName: RoutesName.home,
            onPop: onPopRoute,
            child: const HomeScreen(),
          ),
          applyAnimation: params.applyAnimation,
          transitionType: params.transitionType,
          settings: settings,
        );
        case RoutesName.applyLeaves:
        return CustomRoute.createRoute(
          page: RouteAwareWidget(
            routeName: RoutesName.applyLeaves,
            onPop: onPopRoute,
            child: const ApplyLeave(),
          ),
          applyAnimation: params.applyAnimation,
          transitionType: params.transitionType,
          settings: settings,
        );
        case RoutesName.loadingScreen:
        return CustomRoute.createRoute(
          page: RouteAwareWidget(
            routeName: RoutesName.applyLeaves,
            onPop: onPopRoute,
            child: const Loading(),
          ),
          applyAnimation: params.applyAnimation,
          transitionType: params.transitionType,
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Routes Found"),
            ),
          ),
        );
    }
  }
}


