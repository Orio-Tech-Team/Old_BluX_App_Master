import 'package:blueex_emp_app_flutter/features/hrdesk/presentation/screen/widgets/reqattendance_grid.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';

import 'package:flutter/material.dart';

part 'widgets/body.dart';

class HrdeskScreen extends StatelessWidget {
  const HrdeskScreen({Key? key}) : super(key: key);

  static String id = "hrdesk_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 2,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
