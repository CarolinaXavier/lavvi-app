import 'package:lavvi_app/core/env/env.dart';
import 'package:http/http.dart' as http;

class CustomHttp {
  Future<http.Response> post(String path, {Map<String, String>? headers, dynamic body}) {
    final url = Uri.parse('${Env.instance.get('backend_base_url')}$path');
    print('Base Url: $url');
    return http.post(url, headers: headers, body: body);
  }

  

  // Você pode adicionar outros métodos HTTP como get, put, delete, etc. conforme necessário
}
