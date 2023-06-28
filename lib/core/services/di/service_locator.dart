import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../network/api_client.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
void configureDependencies({
  required Dio dio,
}) {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(
        dio,
      ));

  $initGetIt(getIt);
}
