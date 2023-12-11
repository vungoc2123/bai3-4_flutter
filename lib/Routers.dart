
import 'package:bai_3/Views/Home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Views/Auth/SignIn.dart';
import 'Views/Auth/SignUp.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SignInPage();
      },
    ),
    GoRoute(
      path: '/SignUp',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpPage();
      },
    ),
    GoRoute(
      path: '/Home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
  ],
);
