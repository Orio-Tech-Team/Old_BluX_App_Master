import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/user/user_cubit.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/outline_button.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/login/login_screen.dart';
import 'package:blueex_emp_app_flutter/resources/constants.dart';
import 'package:blueex_emp_app_flutter/shared/routes/navigate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildAppBar extends StatelessWidget with PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    void onSuccess() {
      Navigate.next(context, LoginScreen.id);
    }

    void onLogout() async {
      context.read<UserCubit>().logout();
      await HydratedBlocOverrides.current?.storage.clear();
      onSuccess.call();
    }

    return Container(
      padding: kDefaultPadding,
      child: SafeArea(
        child: SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/logos/appbar_logo.svg', height: 28),
              GestureDetector(
                // onTap: onLogout,
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 245, 99, 9)
                                    .withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.question_mark,
                                size: 60,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyText.h2("Logout App?"),
                            const SizedBox(
                              height: 5,
                            ),
                            MyText.body('Are you sure you want to Logout?'),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: OutlineButton(
                                      child: Text("cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Button(
                                      child: Text("Logout"),
                                      onPressed: onLogout),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                child: SvgPicture.asset(
                  'assets/icons/shared/layout/app_bar/logout.svg',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
