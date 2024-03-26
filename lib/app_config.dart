class AppConfig{

  //
  static const String APP_NAME = "OMS";



  static const String DOMAIN = "https://test.api.chatchefs.com";
  static const String API = "api";
  static const String API_VERSION = "v1";
  static const String BASE_URL = "$DOMAIN/$API";
  static const String LOGIN = "$BASE_URL/accounts/$API_VERSION/login/email/";
  static const String RESTAURANT_LIST = "$BASE_URL/food/v1/restaurant";
  static const String LOCATION_LIST = "$BASE_URL/food/v1/location?restaurant=";
  static const String MENU_LIST = "$BASE_URL/food/v2/menu?restaurant=22&location=55";
  static const String ORDER_LIST = "$BASE_URL/billing/v1/order/merchant";

}