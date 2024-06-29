import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class ApprovedOrdersUseCase {

  WorkerRepository workerRepository;
  @factoryMethod ApprovedOrdersUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID){
    print("invoking Approved OrderS UseCase ");
    return workerRepository.GetApprovedWorkerOrders(workerID);
  }
}