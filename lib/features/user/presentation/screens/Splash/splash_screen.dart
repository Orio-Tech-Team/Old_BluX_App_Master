import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/home/home_screen.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/login/login_screen.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _onSuccess() {
      if (context.read<UserCubit>().isLoggedIn()) {
        Navigate.next(context, HomeScreen.id);
      } else {
        Navigate.next(context, LoginScreen.id);
      }
    }

    void _navigateToNextScreen(VoidCallback onSuccess) async {
      await Future.delayed(const Duration(seconds: 2));
      onSuccess.call();
    }

    useEffect(() {
      _navigateToNextScreen(_onSuccess);
      return null;
    }, []);

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logos/blue_ex.svg',
              width: 170,
            ),
            const SizedBox(height: 40),
            SvgPicture.asset(
              'assets/images/splash_man.svg',
              height: size.height * 0.6,
            ),
          ],
        ),
      ),
    ));
  }
}
