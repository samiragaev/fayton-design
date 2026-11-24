import 'package:fayton_design/presentation/ui/OTP/view/otp_page.dart';
import 'package:fayton_design/presentation/ui/login/view/login_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static const String login = '/login';
  static const String otpPage = '/otpPage';
}

abstract final class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.login => _page(const LoginPage(), settings),
      AppRoutes.otpPage => _page(const OtpPage(), settings),
      _ => _page(const LoginPage(), settings),
    };
  }

  static MaterialPageRoute<T> _page<T>(Widget page, RouteSettings settings) {
    return MaterialPageRoute<T>(builder: (_) => page, settings: settings);
  }
}
