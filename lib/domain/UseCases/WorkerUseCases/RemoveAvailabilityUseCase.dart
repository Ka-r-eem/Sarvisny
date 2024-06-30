import 'package:injectable/injectable.dart';
import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class RemoveAvailabilityUseCase {

  WorkerRepository workerRepository;
  @factoryMethod RemoveAvailabilityUseCase(this.workerRepository);

  Future<dynamic> invoke(String? workerID, String? availabilityID) {
    print("invoking Remove Availability UseCase ");
    return workerRepository.RemoveAvailability(workerID, availabilityID);
  }
}