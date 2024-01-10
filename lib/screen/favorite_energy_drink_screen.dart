import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/item/energy_drink_slim_dto.dart';
import 'package:vsu_project/dto/http/item/page_dto.dart';
import 'package:vsu_project/screen/base_energy_drink_screen.dart';
import 'package:vsu_project/service/energy_drink_service.dart';

class FavoriteEnergyDrinkScreen extends StatefulWidget {
  const FavoriteEnergyDrinkScreen({super.key});

  @override
  State<StatefulWidget> createState() => FavoriteEnergyDrinkScreenState();
}

class FavoriteEnergyDrinkScreenState extends State<FavoriteEnergyDrinkScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseListEnergyDrinkScreen(
      onFavoriteButtonTap: _onFavoriteButtonTap,
      loadData: _loadData,
    );
  }

  Future<PageDto> _loadData(int page, int size) async {
    return EnergyDrinkService().getFavoriteEnergyDrinks(page, size);
  }

  _onFavoriteButtonTap(List<EnergyDrinkSlimDto> dtos, int index) async {
    final element = dtos[index];
    setState(() {
      element.isFavorite = false;
      dtos.removeAt(index);
    });
    await EnergyDrinkService()
        .changeFavorite(element.id, element.isFavorite);
  }
}