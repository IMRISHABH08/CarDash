import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webelight/global/design_system/styles/sizing.dart';

import '../../domain/entities/car_data.dart';
import '../controller/catalog_controller.dart';
import 'details_page.dart';

class ListedCars extends StatelessWidget {
  const ListedCars({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CatalogController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listed Cars'),
      ),
      body: ListView.separated(
        separatorBuilder: (ctx, index) => _Seperator(),
        itemCount: controller.catalogData?.results.length ?? 0,
        itemBuilder: (ctx, i) {
          final car = controller.catalogData!.results[i];
          const italic = TextStyle(fontStyle: FontStyle.italic);
          return Hero(
            tag: car.name,
            child: Material(
              child: ListTile(
                title: Text(car.name),
                subtitle: Text(car.model, style: italic),
                trailing: Text('Max Speed: ${car.maxAtmospheringSpeed}',
                    style: italic),
                onTap: () => _onTap(context, controller, car),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTap(BuildContext context, CatalogController controller, CarData car) {
    controller.setCurrentCar(car);
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DetailsPage(controller);
      },
    ));
  }
}

class _Seperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SpaceX.px10,
      color: Colors.grey[300],
    );
  }
}
