import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/item/energy_drink_dto.dart';
import 'package:vsu_project/dto/http/item/page_dto.dart';
import 'package:vsu_project/service/authentication_service.dart';
import 'package:vsu_project/service/shared_preference_service.dart';
import 'package:vsu_project/utils/api_utils.dart';
import 'package:http/http.dart' as http;

class EnergyDrinkService {
  Future<PageDto> getEnergyDrinks(int page, int size) async {
    return await _loadDrinksPage(ApiUtils.energyDrinks, page, size);
  }

  Future<PageDto> getFavoriteEnergyDrinks(int page, int size) async {
    return await _loadDrinksPage(ApiUtils.favoriteEnergyDrinks, page, size);
  }

  Future<EnergyDrinkDto> getEnergyDrink(int id) async {
    final token = await SharedPreferenceService().getToken();

    final response = await http.get(
      Uri.parse(ApiUtils.energyDrink(id)),
      headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      },
    );

    _validateStatusCode(response);

    final jsonResponseBody = jsonDecode(utf8.decode(response.bodyBytes));
    return EnergyDrinkDto.fromJson(jsonResponseBody);
  }

  changeFavorite(int id, bool isFavorite) async {
    final queryParams = {
      'isFavorite': isFavorite,
    }.map((key, value) => MapEntry(key, value.toString()));

    final token = await SharedPreferenceService().getToken();

    final response = await http.get(
      Uri.parse(ApiUtils.changeFavorite(id))
          .replace(queryParameters: queryParams),
      headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      },
    );

    _validateStatusCode(response);
  }

  Future<Image> getEnergyDrinkImage(int id) async {
    final token = await SharedPreferenceService().getToken();
    return Image.network(
      ApiUtils.energyDrinkImage(id),
      headers: {'Authorization': 'Bearer $token'},
    );
  }

  _validateStatusCode(http.Response response) {
    final status = response.statusCode;
    if (status == 401 || status == 403) {
      AuthenticationService().logout();
    } else if (status != 200) {
      throw Exception('Произошла непредвиденная ошибка');
    }
  }

  Future<PageDto> _loadDrinksPage(String url, int page, int size) async {
    final queryParams = {
      'page': page,
      'size': size,
    }.map((key, value) => MapEntry(key, value.toString()));

    final token = await SharedPreferenceService().getToken();

    final response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParams),
      headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      },
    );

    _validateStatusCode(response);

    final jsonResponseBody = jsonDecode(utf8.decode(response.bodyBytes));
    return PageDto.fromJson(jsonResponseBody);
  }
}
