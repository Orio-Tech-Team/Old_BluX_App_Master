import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/check_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_button.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/attendance_info.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/date_time.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/in_range_text.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance_data/attendance_data_screen.dart';
import 'package:blueex_emp_app_flutter/resources/constants.dart';
import 'package:blueex_emp_app_flutter/shared/route_aware/route_aware.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../GetX/Controller/request_attendance_controller.dart';
import '../../../../../resources/colors.dart';
import '../../../../user/presentation/cubits/user/user_cubit.dart';

part 'widgets/body.dart';

class AttendanceScreen extends HookWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  static String id = "attendance_screen";

  @override
  Widget build(BuildContext context) {
    void checkSameDay() {
      context.read<TodayAttendanceCubit>().checkSameDay();
    }

    Future determinePosition() async {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    useEffect(() {
      determinePosition();
      checkSameDay();
      return null;
    }, []);

    return const Layout(
      body: Body(),
    );
  }
}
