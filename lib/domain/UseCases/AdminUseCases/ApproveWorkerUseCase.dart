
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class ApproveWorkerUseCase {

  AdminRepository adminRepository;
  @factoryMethod ApproveWorkerUseCase(this.adminRepository);

  Future<dynamic> invoke(WorkerID){
    return adminRepository.AdminApprove(WorkerID);
  }
}