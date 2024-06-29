import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class WorkerSlotsUseCase {

  WorkerRepository workerRepository;
  @factoryMethod WorkerSlotsUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID){
    print("invoking WorkerSlots UseCase ");
    return workerRepository.GetWorkerSlots(workerID);
  }
}