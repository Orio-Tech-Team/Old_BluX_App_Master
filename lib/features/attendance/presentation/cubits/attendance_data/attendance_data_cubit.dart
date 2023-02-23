// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/request_attendance_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/entity/attendance_data_entity.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/attendance_data_usecase.dart';
import 'package:blueex_emp_app_flutter/shared/error/failures.dart';
import 'package:blueex_emp_app_flutter/shared/params/attendance_data_params.dart';

part 'attendance_data_state.dart';

class AttendanceDataCubit extends Cubit<AttendanceDataState> {
  final AttendanceDataUseCase attendanceDataUseCase;
  final RequestAttendanceUseCase requestAttendanceUseCase;
  AttendanceDataCubit({
    required this.attendanceDataUseCase,
    required this.requestAttendanceUseCase,
  }) : super(AttendanceDataState.initial());

  Future<void> get(String token, String date) async {
    emit(state.copyWith(status: AttendanceDataStatus.loading));

    final Either<Failure, List<AttendanceData>> attendanceData =
        await attendanceDataUseCase
            .call(AttendanceDataParams(date: date, token: token));

    attendanceData.fold(
      (Failure failure) {
        emit(state.copyWith(status: AttendanceDataStatus.error));
      },
      (List<AttendanceData> attendance) {
        emit(state.copyWith(
            attendanceData: attendance, status: AttendanceDataStatus.loaded));
      },
    );
  }
  Future<String> requestAttendance(AttendanceDataParams params) async {
    String res = '';

    final Either<Failure, String> attendanceData =
    await requestAttendanceUseCase.call(params);

    attendanceData.fold(
          (Failure failure) {},
          (String response) {
        res = response;
      },
    );

    return res;
  }
}
