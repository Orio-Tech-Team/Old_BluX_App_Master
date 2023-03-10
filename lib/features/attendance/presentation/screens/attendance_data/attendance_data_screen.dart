import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/month_listview.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance_data/widgets/table.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/body.dart';

class AttendanceDataScreen extends StatelessWidget {
  const AttendanceDataScreen({Key? key}) : super(key: key);

  static String id = "attendance_data_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(currentTab: 3, body: Body());
  }
}
