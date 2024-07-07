import 'package:injectable/injectable.dart';

import '../../../data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class SetOrderStatusUseCase {

  WorkerRepository workerRepository;
  @factoryMethod SetOrderStatusUseCase(this.workerRepository);

  Future<dynamic> invoke(String? orderId , String? status) {
    print("invoking Set order status UseCase ");
    return workerRepository.SetOrderStatus(orderId, status);
  }
}