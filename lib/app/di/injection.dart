import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fayton_design/data/service/api_client.dart';
import 'package:fayton_design/data/service/token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    )
    ..registerLazySingleton<Connectivity>(Connectivity.new)
    ..registerLazySingleton<TokenStorage>(() => TokenStorage(getIt()))
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(tokenStorage: getIt(), connectivity: getIt()),
    );
}
