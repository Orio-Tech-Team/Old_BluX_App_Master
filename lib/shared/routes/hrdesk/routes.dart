import 'package:blueex_emp_app_flutter/features/hrdesk/presentation/screen/hrdesk_screen.dart';

import 'package:flutter/material.dart';

class HrdeskRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HrdeskScreen.id: (context) => const HrdeskScreen(),
  };
}
