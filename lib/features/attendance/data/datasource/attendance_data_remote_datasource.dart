import 'package:blueex_emp_app_flutter/features/attendance/data/model/attendance_data_model.dart';
import 'package:blueex_emp_app_flutter/shared/network/network.dart';
import 'package:blueex_emp_app_flutter/shared/params/attendance_data_params.dart';

class AttendanceDataRemoteDataSource {
  Future<List<AttendanceDataModel>> getAttendanceData(
      String token, String date) async {
    Map<String, dynamic> data = {
      "attedance_date": date,
    };

    try {
      var res = await NetworkHelper.request(
        url: 'attendance-app/attendance',
        token: token,
        method: 'POST',
        data: data,
      );

      List<AttendanceDataModel> modules = res
          .map<AttendanceDataModel>(
              (json) => AttendanceDataModel.fromJson(json))
          .toList();

      return modules;
    } catch (e) {
      rethrow;
    }
  }

  Future<AttendanceDataModel> getTodayAttendance(String token) async {
    try {
      var res = await NetworkHelper.request(
        url: 'attendance-app/attendance',
        token: token,
      );

      AttendanceDataModel data = AttendanceDataModel.fromJson(res);

      return data;
    } catch (e) {
      rethrow;
    }
  }
  Future<String> requestAttendance(AttendanceDataParams params) async {
    try {
      var res = await NetworkHelper.request(
          method: 'POST',
          url: 'attendance-app/attendance/hr-attendance-update',
          token: params.token,
          data: {
            "date": params.date,
            "time": params.time,
            "type": params.type,
            "comment": params.comment,
          });
      print("success");
      return 'Request successful';
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
