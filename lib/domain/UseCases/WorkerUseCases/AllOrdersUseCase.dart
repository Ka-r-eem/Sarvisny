import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class AllOrdersUseCase {

  WorkerRepository workerRepository;
  @factoryMethod AllOrdersUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID) {
    print("invoking All OrderS UseCase ");
    return workerRepository.GetAllWorkerOrders(workerID);

  }
}