import 'package:get_it/get_it.dart';
import 'package:lavvi_app/controllers/login_controller.dart';
import 'package:lavvi_app/controllers/register_controller.dart';
import 'package:lavvi_app/core/rest_client/custom_http.dart';
import 'package:lavvi_app/repositories/login/login_repository.dart';
import 'package:lavvi_app/repositories/login/login_repository_impl.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerSingleton(CustomHttp());
  getIt.registerSingleton<LoginRepository>(LoginRepositoryImpl(
    getIt<CustomHttp>(),
  ));
  getIt.registerLazySingleton(() => LoginController());
  getIt.registerLazySingleton(() => RegisterController());
}