import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/home_screen.dart';
import 'package:blueex_emp_app_flutter/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';

class HomeCard extends StatelessWidget {
  final String img, title, route;
  final Route<Object?>? routeTo;
  final bool isDisabled;

  const HomeCard({
    super.key,
    required this.img,
    required this.title,
    required this.route,
    this.routeTo,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    onTap() {
      if (isDisabled) return;
      if (routeTo != null) {
        print(route);
        Navigator.push(
            context,
            routeTo ??
                MaterialPageRoute(builder: (context) => const HomeScreen()));
        return;
      } else {
        Navigate.to(context, route);
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isDisabled ? kGray200.withOpacity(0.5) : kGray200,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: isDisabled ? 0.3 : 1,
              child: SvgPicture.asset(
                img,
                width: 60.0,
                height: 60.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: isDisabled ? const TextStyle(color: Colors.grey) : null,
            ),
          ],
        ),
      ),
    );
  }
}
