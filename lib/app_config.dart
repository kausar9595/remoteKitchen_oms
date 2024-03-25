class AppConfig{

  //
  static const String APP_NAME = "OMS";



  static const String DOMAIN = "https://api.chatchefs.com";
  static const String API = "api";
  static const String API_VERSION = "v1";
  static const String BASE_URL = "$DOMAIN/$API";
  static const String LOGIN = "$BASE_URL/accounts/$API_VERSION/login/email/";
  static const String RESTAURANT_LIST = "$BASE_URL//food/v1/restaurant";

}