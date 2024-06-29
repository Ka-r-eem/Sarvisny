import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class CancelOrderUseCase {

  WorkerRepository workerRepository;
  @factoryMethod CancelOrderUseCase(this.workerRepository);

  Future<dynamic> invoke(String orderID){
    print("invoking cancel Order UseCase ");
    return workerRepository.CancelOrder(orderID);
  }
}