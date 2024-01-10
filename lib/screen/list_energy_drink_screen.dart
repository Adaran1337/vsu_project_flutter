import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/item/energy_drink_slim_dto.dart';
import 'package:vsu_project/dto/http/item/page_dto.dart';
import 'package:vsu_project/screen/base_energy_drink_screen.dart';
import 'package:vsu_project/service/energy_drink_service.dart';

class ListEnergyDrinkScreen extends StatefulWidget {
  const ListEnergyDrinkScreen({super.key});

  @override
  State<StatefulWidget> createState() => ListEnergyDrinkScreenState();
}

class ListEnergyDrinkScreenState extends State<ListEnergyDrinkScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseListEnergyDrinkScreen(
      onFavoriteButtonTap: _onFavoriteButtonTap,
      loadData: _loadData,
    );
  }

  Future<PageDto> _loadData(int page, int size) async {
    return EnergyDrinkService().getEnergyDrinks(page, size);
  }

  _onFavoriteButtonTap(List<EnergyDrinkSlimDto> dtos, int index) async {
    final element = dtos[index];
    setState(() {
      element.isFavorite = !element.isFavorite;
    });
    await EnergyDrinkService()
        .changeFavorite(element.id, element.isFavorite);
  }
}
