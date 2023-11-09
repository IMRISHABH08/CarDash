import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webelight/core/injection/injection.dart';

import 'catalog/presentation/controller/catalog_controller.dart';
import 'catalog/presentation/screens/listing_page.dart';
import 'global/components/splash_screen.dart';

void main() => runApp(const Catalog());

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  void initState() {
    super.initState();
    registerOnAppStartUpServices();
  }

  @override
  void dispose() {
    unRegisterOnAppStartUpServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Car Catalog',
      home: const SafeArea(child: Scaffold(body: Dashboard())),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<CatalogController>(
      create: (_) => CatalogController(usecase: GetIt.I.get()),
      builder: (context, _) {
        return Obx(() {
          final controller = context.read<CatalogController>();
          final isLoading = controller.isLaoding.value;
          if (isLoading) return const SplashScreen();
          return const ListedCars();
        });
      },
      dispose: (_, val) => val.dispose(),
    );
  }
}
