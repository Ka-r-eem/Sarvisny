import 'package:injectable/injectable.dart';

import '../../../data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../../RepositoryContract/WorkerRepository.dart';

@injectable
class UploadFileUseCase {

  WorkerRepository workerRepository;
  @factoryMethod UploadFileUseCase(this.workerRepository);

  Future<dynamic> invoke(String? fileName , String? workerID,String? base64 ) {
    print("invoking Upload File UseCase ");
    return workerRepository.UploadFile(fileName, workerID, base64) ;
  }
}