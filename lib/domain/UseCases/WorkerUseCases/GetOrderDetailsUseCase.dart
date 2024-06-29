import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class GetOrderDetailsUseCase {

  WorkerRepository workerRepository;
  @factoryMethod GetOrderDetailsUseCase(this.workerRepository);

  Future<dynamic> invoke(String orderID){
    print("invoking Get Order Details UseCase ");
    return workerRepository.GetOrderDetails(orderID);
  }
}