import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class cascading_menu extends StatelessWidget {
  const cascading_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: const MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xff697565)),
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () async {
            final url = Uri.https('github.com', '/CTTAPKU/pizzeria_aic');
            await launchUrl(url);
          },
          child: const Text("Інформація"),
        ),
        MenuItemButton(
          onPressed: () async {
            final url = Uri.https('t.me', '/akkurokawa');
            await launchUrl(url);
          },
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
