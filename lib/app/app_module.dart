import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/config/client.dart';
import 'package:teste/app/features/home/home_module.dart';

class AppModule extends Module {

  @override
  void binds(Injector i) {
    i.addSingleton(ApiClient.new);
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }

}