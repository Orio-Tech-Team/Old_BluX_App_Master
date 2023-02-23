import 'package:blueex_emp_app_flutter/GetX/Model/request_attendance_model.dart';
import 'package:get/get.dart';

import '../Network/network.dart';

class RequestAttendanceController extends GetxController{
  RxBool isLoading = false.obs;
  List<AttendanceRequestModel>? attendanceRequestModel = [];
  Data? data;

  getAttendanceRequest(var token) async {
    isLoading = true.obs ;
    await Network.getAttendanceRequest(token,).then((value) => {
      isLoading = true.obs,
      if(value.status == 200){
        data = value.data,
        print(data!.id),
        print(data!.type),
        print(data!.attendanceDate),
        print(data!.intime),
        print(data!.outtime),
        isLoading = false.obs,
        //update(),
      }else{
        isLoading = false.obs,
      }

    });
    isLoading = false.obs;
    return attendanceRequestModel;
  }
}