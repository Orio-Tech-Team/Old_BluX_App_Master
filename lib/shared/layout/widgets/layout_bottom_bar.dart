import 'package:blueex_emp_app_flutter/features/attendance/presentation/screens/attendance_data/attendance_data_screen.dart';
import 'package:blueex_emp_app_flutter/features/hrdesk/presentation/screen/hrdesk_screen.dart';
import 'package:blueex_emp_app_flutter/features/notification/presentation/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/home_screen.dart';
import 'package:blueex_emp_app_flutter/shared/layout/widgets/navigation_button.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';

class LayoutBottomBar extends StatefulWidget {
  final int currentTab;

  const LayoutBottomBar({super.key, required this.currentTab});

  @override
  State<LayoutBottomBar> createState() => _LayoutBottomBarState();
}

class _LayoutBottomBarState extends State<LayoutBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 18.0,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationButton(
                  onPressed: () => Navigate.to(context, HomeScreen.id),
                  icon: 'assets/icons/shared/layout/nav_bar/home.svg',
                  text: 'Home',
                  tab: 1,
                  currentTab: widget.currentTab,
                ),
                NavigationButton(
                  onPressed: () => Navigate.to(context, HrdeskScreen.id),
                  icon: 'assets/icons/shared/layout/nav_bar/hr_bottom.svg',
                  text: 'HR desk',
                  tab: 2,
                  isDisabled: false,
                  currentTab: widget.currentTab,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationButton(
                  onPressed: () =>
                      Navigate.to(context, AttendanceDataScreen.id),
                  icon: 'assets/icons/attendance/calender.svg',
                  text: 'Details',
                  tab: 3,
                  isDisabled: false,
                  currentTab: widget.currentTab,
                ),
                NavigationButton(
                  onPressed: () {},
                  icon: 'assets/icons/notification.svg',
                  text: 'Notify',
                  tab: 4,
                  isDisabled: true,
                  currentTab: widget.currentTab,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
