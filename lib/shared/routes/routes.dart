import 'package:blueex_emp_app_flutter/shared/routes/attendance/routes.dart';
import 'package:blueex_emp_app_flutter/shared/routes/hrdesk/routes.dart';
import 'package:blueex_emp_app_flutter/shared/routes/notification/routes.dart';
import 'package:blueex_emp_app_flutter/shared/routes/rider/routes.dart';
import 'package:blueex_emp_app_flutter/shared/routes/user/routes.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    ...UserRoutes.routes,
    ...AttendanceRoutes.routes,
    ...RiderRoutes.routes,
    ...NotificationRoutes.routes,
    ...HrdeskRoutes.routes,
  };
}
