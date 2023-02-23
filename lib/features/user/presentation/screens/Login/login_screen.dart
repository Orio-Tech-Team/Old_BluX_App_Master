import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/otp/otp_screen.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/alert.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text_field_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
