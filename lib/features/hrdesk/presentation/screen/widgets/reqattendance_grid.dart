import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/request_attendance/request_attendance_screen.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/card.dart';
import 'package:flutter/material.dart';

class RequestAttendanceGrid extends StatelessWidget {
  const RequestAttendanceGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
        ),
        itemCount: 1,
        itemBuilder: (context, index) {
          return GridTile(
            child: HomeCard(
              img: 'assets/icons/attendance/request_icon.svg',
              title: 'Request',
              route: '',
              routeTo: MaterialPageRoute(
                builder: (context) => RequestAttendanceScreen(),
              ),
              isDisabled: false,
            ),
          );
        });
  }
}
