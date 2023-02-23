import 'package:blueex_emp_app_flutter/features/notification/presentation/screen/notification_screen.dart';

import 'package:flutter/material.dart';

class NotificationRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    NotificationScreen.id: (context) => const NotificationScreen(),
  };
}
