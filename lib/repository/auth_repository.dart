import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseAPIServices _apiServices = NetworkAPIService();

  Future<dynamic> loginAPI(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostAPIResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerAPI(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostAPIResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
