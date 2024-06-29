import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class GetRegisteredServicesUseCase {

  WorkerRepository workerRepository;
  @factoryMethod GetRegisteredServicesUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID){
    print("invoking Get Registered Services UseCase ");
    return workerRepository.GetRegisteredServices(workerID);
  }
}