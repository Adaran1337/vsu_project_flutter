class EnergyDrinkSlimDto {
  final int id;

  final String title;

  final String subTitle;

  bool isFavorite;

  EnergyDrinkSlimDto(this.id, this.title, this.subTitle, this.isFavorite);

  EnergyDrinkSlimDto.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        subTitle = json['subTitle'] as String,
        isFavorite = json['isFavorite'] as bool;
}
