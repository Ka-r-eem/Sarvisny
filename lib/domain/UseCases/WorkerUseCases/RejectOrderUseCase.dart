import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class RejectOrderUseCase {

  WorkerRepository workerRepository;
  @factoryMethod RejectOrderUseCase(this.workerRepository);

  Future<dynamic> invoke(String orderID){
    print("invoking Reject Order UseCase ");
    return workerRepository.RejectOrder(orderID);
  }
}