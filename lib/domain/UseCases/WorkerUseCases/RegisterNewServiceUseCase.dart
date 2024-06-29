import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class RegisterNewServiceUseCase {

  WorkerRepository workerRepository;
  @factoryMethod RegisterNewServiceUseCase(this.workerRepository);

  Future<dynamic> invoke(String? workerID, String? serviceID, double? price){
    print("invoking Register New Service UseCase ");
    return workerRepository.RegisterNewService(workerID,serviceID,price);
  }
}