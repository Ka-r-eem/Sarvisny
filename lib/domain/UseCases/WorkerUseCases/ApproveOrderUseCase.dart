import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class ApproveOrderUseCase {

  WorkerRepository workerRepository;
  @factoryMethod ApproveOrderUseCase(this.workerRepository);

  Future<dynamic> invoke(String orderID){
    print("invoking Approve Order UseCase ");
    return workerRepository.ApproveOrder(orderID);
  }
}