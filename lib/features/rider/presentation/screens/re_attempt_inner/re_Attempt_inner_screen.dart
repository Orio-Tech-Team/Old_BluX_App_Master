import 'package:blueex_emp_app_flutter/features/rider/presentation/screens/pickup/widgets/pickup_card.dart';
import 'package:blueex_emp_app_flutter/features/rider/presentation/screens/updated_status/updated_status_screen.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/card_cell.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/top_bar.dart';
import 'package:flutter/material.dart';

part 'widgets/body.dart';

class ReAttemptInnerScreen extends StatelessWidget {
  const ReAttemptInnerScreen({Key? key}) : super(key: key);

  static String id = "re_attempt_inner_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Body(),
    );
  }
}
