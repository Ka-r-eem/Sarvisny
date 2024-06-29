
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';

@injectable
class ShowFilteredWorkersUseCase {

  AdminRepository adminRepository;
  @factoryMethod ShowFilteredWorkersUseCase(this.adminRepository);

  Future<List<WorkerData>?> invoke(serviceID){
    return adminRepository.GetAllWorkersForService(serviceID);
  }
}