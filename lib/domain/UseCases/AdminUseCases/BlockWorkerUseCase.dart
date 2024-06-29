
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class BlockWorkerUseCase {

  AdminRepository adminRepository;
  @factoryMethod BlockWorkerUseCase(this.adminRepository);

  Future<dynamic> invoke(providerID){
    return adminRepository.BlockProvider(providerID);
  }
}