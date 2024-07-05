import 'package:injectable/injectable.dart';

import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class GetWorkerImageUseCase {

  WorkerRepository workerRepository;
  @factoryMethod GetWorkerImageUseCase(this.workerRepository);

  Future<dynamic> invoke(String workerId){
    print("invoking Get Worker Image UseCase ");
    return workerRepository.GetWorkerImage(workerId);
  }
}