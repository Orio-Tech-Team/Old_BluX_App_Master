import 'package:blueex_emp_app_flutter/GetX/Model/request_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance/widgets/check_item.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class AttendanceInfo extends StatelessWidget {
  Data data;
   AttendanceInfo(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckItem(
            icon: 'assets/icons/attendance/check_in.svg',
            text: 'Check In',
            time: data.intime != null?data.intime:"--;--",
            /*time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .checkIn !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkIn!
                    .substring(0, 5)
                : '--:--',*/
          ),
          CheckItem(
            icon: 'assets/icons/attendance/check_out.svg',
            text: 'Check Out',
            time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .checkOut !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkOut!
                    .substring(0, 5)
                : '--:--',
          ),
          CheckItem(
            icon: 'assets/icons/attendance/hours.svg',
            text: 'Working Hours',
            time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .workingHours !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .workingHours!
                    .substring(0, 5)
                : '--:--',
          ),
        ],
      ),
    );
  }
}
