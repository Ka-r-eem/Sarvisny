
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class UnBlockWorkerUseCase {

  AdminRepository adminRepository;
  @factoryMethod UnBlockWorkerUseCase(this.adminRepository);

  Future<dynamic> invoke(providerID){
    return adminRepository.UnBlockProvider(providerID);
  }
}