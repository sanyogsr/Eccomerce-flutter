import 'package:eccomerce/features/auth/auth.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routesettings) {
  switch (routesettings.name) {
    case Auth.routeName:
      return MaterialPageRoute(builder: (_) => Auth());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('This pages does not exist'),
                ),
              ));
  }
}
