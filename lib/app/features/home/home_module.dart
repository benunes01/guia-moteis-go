import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/core/config/client.dart';
import 'package:teste/app/features/home/domain/repositories/i_motel_repository.dart';
import 'package:teste/app/features/home/domain/usecases/get_all_usecase.dart';
import 'package:teste/app/features/home/external/i_motel_service.dart';
import 'package:teste/app/features/home/external/motel_service.dart';
import 'package:teste/app/features/home/infra/repositories/motel_repository.dart';
import 'package:teste/app/features/home/presenter/pages/home_page.dart';
import 'package:teste/app/features/home/presenter/stores/motel_store.dart';

class HomeModule extends Module {

  @override
  void binds(Injector i) {
    i.addSingleton(ApiClient.new);

    i.add<IMotelRepository>(MotelRepository.new);
    i.add<IMotelService>(MotelService.new);
    i.add(GetAllUseCase.new);
    i.addSingleton(MotelStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }

}