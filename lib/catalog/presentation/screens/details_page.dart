import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/design_system/styles/sizing.dart';
import '../controller/catalog_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(this.controller, {super.key});
  final CatalogController controller;

  @override
  Widget build(BuildContext context) {
    return InheritedProvider.value(
      value: controller,
      builder: (context, child) {
        final controller = context.read<CatalogController>();
        final carDetails = controller.currentSelectedCar.value;

        return Hero(
          tag: carDetails.name,
          child: Scaffold(
            appBar: AppBar(title: Text(carDetails.name)),
            body: SingleChildScrollView(
                child: Column(
              children: [
                _DetailTile(title: 'Name', subTitle: carDetails.name),
                _DetailTile(title: 'Model', subTitle: carDetails.model),
                _DetailTile(
                    title: 'Atmospheric Speed',
                    subTitle: carDetails.maxAtmospheringSpeed),
                _DetailTile(
                    title: 'Passengers', subTitle: carDetails.passengers),
                _DetailTile(title: 'Class', subTitle: carDetails.vehicleClass),
                _DetailTile(title: 'Length', subTitle: carDetails.length),
                _DetailTile(
                    title: 'Manufac.', subTitle: carDetails.manufacturer),
              ],
            )),
          ),
        );
      },
    );
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(SpaceX.px10),
      margin: const EdgeInsets.all(SpaceX.px10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: SpaceX.px10),
          Text(subTitle, style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
