import 'dart:io';

import 'package:dio/dio.dart';

import '../Model/request_attendance_model.dart';

class Network {
  static Response? response;
  static Dio? _dio = Dio();

  static Future<AttendanceRequestModel> getAttendanceRequest(var token) async {
    try {
      response = await _dio!.get('http://api.blue-ex.com:5000/attendance-app/attendance/get_employee_attendance',options: Options(
        headers: {
          'Accept': "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $token'
        }
      ));
    } on DioError catch (e) {
      print(e.error);
        return AttendanceRequestModel.fromJson(e.response!.data);
    }
    return AttendanceRequestModel.fromJson(response!.data);
  }
  /*static Future<List<AttendanceRequestModel>?> getAttendanceRequest(var token) async {
    try {
      response = await _dio!.get('http://api.blue-ex.com:5000/attendance-app/attendance/get_employee_attendance',options: Options(
          headers: {
            'Accept': "application/json",
            HttpHeaders.authorizationHeader: 'Bearer $token'
          }
      ));
      List<AttendanceRequestModel>? list =(response!.data as List)
          .map((x) => AttendanceRequestModel.fromJson(x)).cast<AttendanceRequestModel>()
          .toList();
      return list;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.error);
        return e.response!.data;
      }
    }
    return response!.data;;
  }*/
}

