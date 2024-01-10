import 'package:vsu_project/dto/http/item/energy_drink_slim_dto.dart';

class PageDto {
  List<EnergyDrinkSlimDto> data;

  int count;

  PageDto({required this.data, required this.count});

  factory PageDto.fromJson(Map<String, dynamic> json) {
    final data = List<EnergyDrinkSlimDto>.empty(growable: true);
    json['data'].forEach((list) {
      data.add(EnergyDrinkSlimDto.fromJson(list));
    });

    return PageDto(
      data: data,
      count: json['count'] as int,
    );
  }
}
