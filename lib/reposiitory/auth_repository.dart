import 'package:mvvm_architecture/data/network/base_api_services.dart';
import 'package:mvvm_architecture/data/network/network_api_service.dart';
import 'package:mvvm_architecture/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.login, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
