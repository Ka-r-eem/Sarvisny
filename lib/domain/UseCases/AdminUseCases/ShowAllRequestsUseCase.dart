
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';

@injectable
class ShowAllRequestsUseCase {

  AdminRepository adminRepository;
  @factoryMethod ShowAllRequestsUseCase(this.adminRepository);

  Future<List<WorkerRequest>?> invoke(){
    return adminRepository.AdminGetRequests();
  }
}