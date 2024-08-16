import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/controller/theme_controller.dart';
import 'package:getx/pages/page_comprar.dart';
import 'package:getx/pages/page_detalle.dart';
import 'package:getx/pages/page_pagar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get X'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Row(
              children: [
                GetBuilder<ProductController>(
                  init: ProductController(),
                  builder: (_) => Text(
                    _.countProduct.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _productController.showBottomSheet,
                  child: const Icon(
                    Icons.adb_rounded,
                  ),
                ),
                const SizedBox(width: 10),
                GetBuilder<ThemeController>(
                  init: ThemeController(),
                  builder: (_) => Obx(
                    () => Switch(
                      value: _.isThemeDark,
                      onChanged: (v) => _.changeTheme(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Center(
            child: Text('main page'),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  ///Navegar a una nueva página
                  Get.to<void>(() => const PageDetalle());
                },
                child: const Text('Details'),
              ),
              TextButton(
                onPressed: () {
                  ///Navegar a una nueva página y elimina la anterior
                  Get.off<void>(() => const PageComprar());
                },
                child: const Text('Shop'),
              ),
              TextButton(
                onPressed: () {
                  ///Navegar a una nueva página y elimina todas las anteriores
                  Get.offAll<void>(() => const PagePagar());
                },
                child: const Text('Pay'),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _productController.increment,
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: _productController.decrement,
                icon: const Icon(Icons.text_decrease_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
