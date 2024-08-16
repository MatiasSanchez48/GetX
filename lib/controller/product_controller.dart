import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/theme_controller.dart';

class ProductController extends GetxController {
  int _countProduct = 0;
  int get countProduct => _countProduct;

  void increment() {
    showAlertDialog(
      title: 'Decrement',
      icon: Icons.add_circle_outline,
      colorsIcon: Colors.green,
    );
    showSnackBar(
      title: 'Increment',
      message: 'Product add: $_countProduct',
      backgroundColor: Colors.green,
    );
    _countProduct++;
    update();
  }

  void decrement() {
    showAlertDialog(
      title: 'Decrement',
      icon: Icons.remove_circle_outline,
      colorsIcon: Colors.red,
    );

    showSnackBar(
      title: 'Decrement',
      message: 'Product remove: $_countProduct',
      backgroundColor: Colors.red,
    );
    _countProduct--;
    update();
  }

  void showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

  void showBottomSheet() {
    Get.bottomSheet<void>(
      GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (_) => Container(
          height: 200,
          color: _.isThemeDark ? Colors.black : Colors.white,
          child: Wrap(
            children: [
              ListTile(
                title: const Text('Counter'),
                subtitle: Text('$_countProduct'),
                trailing: const Icon(Icons.dashboard),
              ),
              ListTile(
                title: const Text('Theme '),
                subtitle: Text(_.isThemeDark ? 'Dark' : 'Light'),
                trailing: const Icon(Icons.threesixty),
              ),
              ListTile(
                title: const Text('Route'),
                subtitle: Text(Get.currentRoute),
                trailing: const Icon(Icons.accessible),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog({
    required String title,
    required IconData icon,
    required Color colorsIcon,
  }) {
    Get.dialog<void>(
      AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 100,
          height: 100,
          child: Icon(
            icon,
            size: 100,
            color: colorsIcon,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back<void>(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
