import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/module/module_cubit.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/slider/slider_cubit.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/otp/widgets/app_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/home_screen.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/otp/widgets/text_field_box.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/alert.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';

part 'widgets/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static String id = "otp_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpAppBar(),
      body: Body(),
    );
  }
}
