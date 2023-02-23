import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:blueex_emp_app_flutter/shared/params/attendance_data_params.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/correction_alert.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/date_selector.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/dropdown.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text_field_container.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/time_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../GetX/Controller/request_attendance_controller.dart';
import '../../../../../GetX/Network/network.dart';
import '../../../../../shared/widgets/text_area.dart';
import '../../../../user/presentation/cubits/user/user_cubit.dart';
import '../../cubits/today_attendance/today_attendance_cubit.dart';


part 'widgets/body.dart';

class RequestAttendanceScreen extends HookWidget {
  const RequestAttendanceScreen({Key? key}) : super(key: key);

  static String id = "request_attendance_screen";
  @override
  Widget build(BuildContext context) {
    return const Layout(body: Body());
  }
}
