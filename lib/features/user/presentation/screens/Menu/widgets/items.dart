import 'package:blueex_emp_app_flutter/shared/widgets/card.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';

class HomeItems extends StatelessWidget {
  final List menu;

  const HomeItems({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
          ),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            String route = menu[index].tag;

            Route? routeTo = menu[index].subMenus.length > 1
                ? MaterialPageRoute(
                    builder: (context) => MenuScreen(
                      menu: menu[index].subMenus,
                    ),
                  )
                : null;

            return GridTile(
              child: HomeCard(
                img: menu[index].icon,
                title: menu[index].name,
                route: route,
                routeTo: routeTo,
                isDisabled: false,
              ),
            );
          }),
    );
  }
}
