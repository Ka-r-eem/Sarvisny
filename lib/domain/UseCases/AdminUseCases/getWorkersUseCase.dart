
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

import '../../model/WorkerRelatedResponse/WorkersListResponse.dart';
@injectable
class getWorkersUseCase {

  AdminRepository adminRepository;
  @factoryMethod getWorkersUseCase(this.adminRepository);

  Future<List<WorkerListObject>?> invoke(){
    print("invoking");
    var workers = adminRepository.getWorkers();
    print(workers);
    return adminRepository.getWorkers();
  }
}