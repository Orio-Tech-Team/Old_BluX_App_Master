import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/request_attendance_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/attendance_data_usecase.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/today_attendance_usecase.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/attendance_data/attendance_data_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/station/station_cubit.dart';
import 'package:blueex_emp_app_flutter/features/attendance/presentation/cubits/today_attendance/today_attendance_cubit.dart';

class AttendanceBlocProviders {
  static List<BlocProvider> providers = [
    // Station
    BlocProvider<StationCubit>(
      create: (context) => StationCubit(
        stationUseCase: context.read<StationUseCase>(),
      ),
    ),
    // Attendance Data
    BlocProvider<AttendanceDataCubit>(
      create: (context) => AttendanceDataCubit(
        attendanceDataUseCase: context.read<AttendanceDataUseCase>(),
        requestAttendanceUseCase: context.read<RequestAttendanceUseCase>(),
      ),
    ),
    // Today Attendance
    BlocProvider<TodayAttendanceCubit>(
      create: (context) => TodayAttendanceCubit(
        todayAttendanceUseCase: context.read<TodayAttendanceUseCase>(),
      ),
    ),
  ];
}
