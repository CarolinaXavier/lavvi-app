import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:lavvi_app/core/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('backend_base_url'),
          ),
        );
}
