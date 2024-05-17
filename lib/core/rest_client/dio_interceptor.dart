import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lavvi_app/core/storage/storage.dart';
import 'package:lavvi_app/pages/login_page.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await Storage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }

  @override
  onError(DioException e, ErrorInterceptorHandler handler) {
    print('Passou por aqui onError $e');
    if (e.response?.statusCode == 401) {
      Get.offAll(const LoginPage());
      Storage.clear();
      return handler.next(e);
    }
    return handler.next(e);
  }
}
