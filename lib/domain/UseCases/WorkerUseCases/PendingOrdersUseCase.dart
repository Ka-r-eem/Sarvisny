import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class PendingOrdersUseCase {

  WorkerRepository workerRepository;
  @factoryMethod PendingOrdersUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID){
    print("invoking Pending OrderS UseCase ");
    return workerRepository.GetPendingWorkerOrders(workerID);
  }
}