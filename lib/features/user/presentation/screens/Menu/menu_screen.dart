import 'package:blueex_emp_app_flutter/features/user/domain/entity/menu_entity.dart';
import 'package:blueex_emp_app_flutter/features/user/presentation/screens/menu/widgets/items.dart';
import 'package:blueex_emp_app_flutter/shared/layout/layout.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final List<Menu> menu;

  const MenuScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: HomeItems(
        menu: menu,
      ),
    );
  }
}
