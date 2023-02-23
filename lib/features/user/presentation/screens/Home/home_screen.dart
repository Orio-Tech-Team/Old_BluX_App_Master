import 'package:blueex_emp_app_flutter/features/user/domain/entity/menu_entity.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/widgets/carousal.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/widgets/home_items_grid.dart';
import 'package:flutter/material.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/widgets/hi.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';

part 'widgets/body.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    Future determinePosition() async {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    useEffect(() {
      determinePosition();
      return null;
    }, []);

    return const Layout(
      currentTab: 1,
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
