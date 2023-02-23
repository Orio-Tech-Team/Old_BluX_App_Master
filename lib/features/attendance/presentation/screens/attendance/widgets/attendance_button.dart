import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';
import 'package:blueex_emp_app_flutter/resources/colors.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:get/get.dart';

import '../../../../../../GetX/Controller/request_attendance_controller.dart';

class AttendanceButton extends StatefulWidget {
  final bool isInRange;

  const AttendanceButton({super.key, required this.isInRange});

  @override
  State<AttendanceButton> createState() => _AttendanceButtonState();
}

class _AttendanceButtonState extends State<AttendanceButton> {
  RequestAttendanceController requestAttendanceController = Get.put(RequestAttendanceController());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    void fetchAttendance(String token) async {
      setState(() => isLoading = true);
      await context.read<TodayAttendanceCubit>().get(token);
      //requestAttendanceController.data!.outtime = '';

      setState(() => isLoading = false);
    }

    return GestureDetector(
      onTap: (() {
        if (widget.isInRange) {
          String token = context.read<UserCubit>().state.user.token;
          fetchAttendance(token);
          requestAttendanceController.getAttendanceRequest(context.read<UserCubit>().state.user.token,);
        }
      }),
      child: Container(
        width: 172,
        height: 172,
        decoration: BoxDecoration(
          color: widget.isInRange ? null : kGray500,
          gradient: widget.isInRange
              ? (context
                          .watch<TodayAttendanceCubit>()
                          .state
                          .attendanceData
                          .checkIn ==
                      null
                  ? kGradient
                  : kGradient2)
              : null,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkIn ==
                        null
                    ? SvgPicture.asset(
                        'assets/icons/attendance/attendance_click.svg',
                        color: Colors.white,
                        width: 70,
                        height: 70,
                      )
                    : SvgPicture.asset(
                        'assets/icons/attendance/checkout.svg',
                        color: Colors.white,
                        width: 70,
                        height: 70,
                      ),
            const SizedBox(height: 10),
            Text(
              context
                          .watch<TodayAttendanceCubit>()
                          .state
                          .attendanceData
                          .checkIn ==
                      null
                  ? 'Check In'
                  : 'Check Out',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
