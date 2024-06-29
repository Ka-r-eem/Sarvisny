
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class RejectWorkerUseCase {

  AdminRepository adminRepository;
  @factoryMethod RejectWorkerUseCase(this.adminRepository);

  Future<dynamic> invoke(WorkerID){
    return adminRepository.AdminReject(WorkerID);
  }
}