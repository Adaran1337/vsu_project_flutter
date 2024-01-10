class ApiUtils {
  // static const String _baseApiPath = 'http://10.0.2.2:8080/api';
  static const String _baseApiPath = 'http://89.223.123.88:8080/api';

  static const String login = '$_baseApiPath/auth/login';
  static const String register = '$_baseApiPath/auth/register';

  static const String energyDrinks = '$_baseApiPath/energy-drink';
  static const String favoriteEnergyDrinks =
      '$_baseApiPath/energy-drink/favorite';

  static String energyDrink(int id) {
    return '$_baseApiPath/energy-drink/$id';
  }

  static String changeFavorite(int id) {
    return '$_baseApiPath/energy-drink/$id/change-favorite';
  }

  static String energyDrinkImage(int id) {
    return '$_baseApiPath/energy-drink/$id/image';
  }
}
