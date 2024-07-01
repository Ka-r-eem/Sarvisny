import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/AdminUseCases/GetChildrenForServiceUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';



@injectable
class ChildrenServicesViewModel extends Cubit<ChildrenServicesListState> {

  GetChildrenUseCase getChildrenUseCase ;

  ChildrenServicesViewModel(this.getChildrenUseCase) :super(ChildrenServicesListLoading("Loading..."));


  void GetChildrenServicesList(serviceId) async {
    emit(ChildrenServicesListLoading("Loading..."));

    try {
      var children = await getChildrenUseCase.invoke(serviceId);
      emit(ChildrenServicesListSuccess(children.payload?.children));
    }
    catch (e) {
      emit(ChildrenServicesListError(e.toString()));
      print("in the catch of Children services");
    }
  }}


sealed class ChildrenServicesListState {}

class ChildrenServicesListSuccess extends ChildrenServicesListState {

  List<Children>? children ;


  ChildrenServicesListSuccess(this.children);

}

class ChildrenServicesListLoading extends ChildrenServicesListState {
  String message;

  ChildrenServicesListLoading(this.message);
}

class ChildrenServicesListError extends ChildrenServicesListState {
  String message;

  ChildrenServicesListError(this.message);
}