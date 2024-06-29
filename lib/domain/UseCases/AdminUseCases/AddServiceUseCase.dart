
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
@injectable
class AddServiceUseCase {

  AdminRepository adminRepository;
  @factoryMethod AddServiceUseCase(this.adminRepository);

  Future<dynamic> invoke(data){
    print("invoking Add Service UseCase! ");
    return adminRepository.AddService(data);
  }
}