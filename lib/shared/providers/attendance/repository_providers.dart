import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/request_attendance_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blueex_emp_app_flutter/features/attendance/data/datasource/attendance_data_remote_datasource.dart';
import 'package:blueex_emp_app_flutter/features/attendance/data/datasource/station_remote_datasource.dart';
import 'package:blueex_emp_app_flutter/features/attendance/data/mapper/attendance_data_mapper.dart';
import 'package:blueex_emp_app_flutter/features/attendance/data/mapper/station_mapper.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/repository/attendance_data_repository_impl.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/repository/station_repository_impl.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/attendance_data_usecase.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/today_attendance_usecase.dart';

class AttendanceRepositoryProviders {
  static List<RepositoryProvider> providers = [
    // Stations
    RepositoryProvider<StationUseCase>(
      create: (context) => StationUseCase(
        repository: StationRepositoryImpl(
            stationMapper: StationMapper(),
            stationRemoteDataSource: StationRemoteDataSource()),
      ),
    ),
    // Attendance Data
    RepositoryProvider<AttendanceDataUseCase>(
      create: (context) => AttendanceDataUseCase(
        repository: AttendanceDataRepositoryImpl(
            attendanceDataMapper: AttendanceDataMapper(),
            attendanceDataRemoteDataSource: AttendanceDataRemoteDataSource()),
      ),
    ),
    // TodayAttendance
    RepositoryProvider<TodayAttendanceUseCase>(
      create: (context) => TodayAttendanceUseCase(
        repository: AttendanceDataRepositoryImpl(
            attendanceDataMapper: AttendanceDataMapper(),
            attendanceDataRemoteDataSource: AttendanceDataRemoteDataSource()),
      ),
    ),
    // RequestAttendance
    RepositoryProvider<RequestAttendanceUseCase>(
      create: (context) => RequestAttendanceUseCase(
        repository: AttendanceDataRepositoryImpl(
            attendanceDataMapper: AttendanceDataMapper(),
            attendanceDataRemoteDataSource: AttendanceDataRemoteDataSource()),
      ),
    ),
  ];
}
