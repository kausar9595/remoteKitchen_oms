class AppConfig {
  //
  static const String APP_NAME = "OMS";
  static const String APP_VERSION = "1.0.4";

  static const String DASHBOARD = "https://dashboard.chatchefs.com/dashboard";
  static const String API_DOMAIN = "https://api.chatchefs.com";
  static const String API = "api";
  static const String API_VERSION = "v1";
  static const String BASE_URL = "$API_DOMAIN/$API";
  static const String LOGIN = "$BASE_URL/accounts/$API_VERSION/login/email/";
  static const String RESTAURANT_LIST = "$BASE_URL/food/v1/restaurant";
  static const String LOCATION_LIST = "$BASE_URL/food/v1/location?restaurant=";
  static const String MENU_LIST = "$BASE_URL/food/v2/menu?restaurant=22&location=55";
  static const String ORDER_LIST = "$BASE_URL/billing/v1/order/merchant";
  static const String ORDER_STATUS = "$BASE_URL/billing/v1/order/item/";
  static const String CURIAR_INFO = "$BASE_URL/billing/v1/doordash/status/?order_id=";
  static const String STORE_DEVICE_TOKEN = "$BASE_URL/firebase/v1/token/company/";
}
