import 'dart:convert';

import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/model/menu_model/menu_items_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/menu_model/menu_list_model.dart';

class MenusController {
  //get menus
  static Future<MenuListModel> getMenuList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var restaurantId = pref.getString("restaurant_id");
    var locationId = pref.getString("location_id");

    final url = "${AppConfig.BASE_URL}/food/v2/menu?restaurant=$restaurantId&location=$locationId";

    final response = await Api.getApi(url: url);

    final decodedBody = utf8.decode(response.bodyBytes);
    return MenuListModel.fromJson(jsonDecode(decodedBody));
  }

  static Future<MenuItemsListModel> getMenuItemsList(int menuId) async {
    final url = "${AppConfig.BASE_URL}/food/v2/menu/item/?id=$menuId";

    final response = await Api.getApi(url: url);
    final decodedBody = utf8.decode(response.bodyBytes);
    return MenuItemsListModel.fromJson(jsonDecode(decodedBody));
  }

  static Future<int> changeAvailability(List<int> menuItemIds, bool isAvailable) async {
    final json = {
      "itemId": menuItemIds,
      "today": isAvailable,
    };
    const url = "${AppConfig.BASE_URL}/food/v1/menu-item/availability/";
    print(menuItemIds);
    print(isAvailable);
    final response = await Api.pathch(url: url, body: json);
    return response.statusCode;
  }
}
