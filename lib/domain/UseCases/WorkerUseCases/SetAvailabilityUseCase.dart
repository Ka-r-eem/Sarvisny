import 'package:injectable/injectable.dart';

import '../../../data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class SetAvailabilityUseCase {

  WorkerRepository workerRepository;
  @factoryMethod SetAvailabilityUseCase(this.workerRepository);

  Future<dynamic> invoke(String? workerID, SetAvailabilityResponseDto setAvailabilityResponse){
    print("invoking SetAvailability UseCase ");
    return workerRepository.SetAvailability(workerID, setAvailabilityResponse);
  }
}