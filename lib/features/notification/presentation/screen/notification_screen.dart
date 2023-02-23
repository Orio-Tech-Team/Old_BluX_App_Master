import 'package:blueex_emp_app_flutter/features/notification/presentation/screen/widgets/notification_tile.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String id = "notification_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      currentTab: 4,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
