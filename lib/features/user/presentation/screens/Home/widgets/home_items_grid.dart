import 'package:blueex_emp_app_flutter/features/user/domain/entity/module_entity.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/cubits/module/module_cubit.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/menu/menu_screen.dart';
import 'package:blueex_emp_app_flutter/shared/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeItemsGrid extends StatelessWidget {
  const HomeItemsGrid({
    Key? key,
  }) : super(key: key);

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
          itemCount: BlocProvider.of<ModuleCubit>(context).state.modules.length,
          itemBuilder: (context, index) {
            Module module =
                BlocProvider.of<ModuleCubit>(context).state.modules[index];

            String route = module.menus.length < 2 ? module.menus[0].tag : '';
            Route? routeTo = module.menus.length > 1
                ? MaterialPageRoute(
                    builder: (context) => MenuScreen(
                      menu: module.menus,
                    ),
                  )
                : null;
            return GridTile(
              child: HomeCard(
                img: 'assets/icons/user/menu/${module.icon}',
                title: module.name,
                route: route,
                routeTo: routeTo,
                isDisabled: module.hide,
              ),
            );
          }),
    );
  }
}
