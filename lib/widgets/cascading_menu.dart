import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/settings.dart';

class cascading_menu extends StatelessWidget {
  const cascading_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xff697565)),

      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => settings()));
          },
          child: const Text("Налаштування"),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text("Інформація"),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text("Допомога"),
        )
      ],
      builder: (_, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
