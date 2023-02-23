import 'package:blueex_emp_app_flutter/shared/network/network.dart';

class NotificationDataSource {
  Future<bool> get(String token, String type) async {
    Map<String, dynamic> data = {
      type: type,
    };

    try {
      final res = await NetworkHelper.request(
        method: 'POST',
        url: 'attendance-app/notification',
        token: token,
        data: data,
      );

      print(res);

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
