import 'package:blueex_emp_app_flutter/features/attendance/domain/repository/attendance_data_repository_impl.dart';
import 'package:blueex_emp_app_flutter/shared/error/failures.dart';
import 'package:blueex_emp_app_flutter/shared/params/attendance_data_params.dart';
import 'package:blueex_emp_app_flutter/shared/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class RequestAttendanceUseCase extends UseCase<String, AttendanceDataParams> {
  final AttendanceDataRepositoryImpl repository;

  RequestAttendanceUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(AttendanceDataParams params) {
    return repository.requestAttendance(params: params);
  }
}
