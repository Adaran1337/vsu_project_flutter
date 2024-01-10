import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/item/energy_drink_dto.dart';
import 'package:vsu_project/layout/base_layout.dart';
import 'package:vsu_project/service/energy_drink_service.dart';

class EnergyDrinkScreen extends StatelessWidget {
  final int id;

  const EnergyDrinkScreen({super.key, required this.id});

  Future<EnergyDrinkDto> _getEnergyDrink() async {
    final energyDrink = await EnergyDrinkService().getEnergyDrink(id);
    energyDrink.image = await EnergyDrinkService().getEnergyDrinkImage(id);
    return energyDrink;
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: _getEnergyDrink(),
            builder:
                (BuildContext context, AsyncSnapshot<EnergyDrinkDto> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Возникла ошибка: ${snapshot.error}',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return SingleChildScrollView(
                      child: Column(
                    children: [
                      data.image!,
                      Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data.subTitle,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        data.description,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ));
                }
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
