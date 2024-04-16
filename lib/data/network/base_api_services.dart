abstract class BaseAPIServices {
  Future<dynamic> getGetAPIResponse(String url);
  Future<dynamic> getPostAPIResponse(String url, dynamic data);
}
