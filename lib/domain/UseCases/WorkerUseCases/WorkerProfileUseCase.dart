import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class WorkerProfileUseCase {

  WorkerRepository workerRepository;
  @factoryMethod WorkerProfileUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerID){
    print("invoking WorkerProfile UseCase ");
    return workerRepository.GetWorkerProfile(workerID);
  }
}