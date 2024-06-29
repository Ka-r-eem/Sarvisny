import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/UseCases/AdminUseCases/GetAllDistrictsUseCase.dart';
import '../../../domain/model/AdminRelatedResponses/GetDistrictsData.dart';



@injectable
class DistrictsListViewModel extends Cubit<DistrictsListState> {


  GetAllDistrictsUseCase? showDistricts ;


  @factoryMethod DistrictsListViewModel(this.showDistricts) :super(DistrictsListLoading("Loading..."));


  void GetDistrictsList() async {
  emit(DistrictsListLoading("Loading..."));

  try {
    GetDistrictsData districts = await showDistricts!.invoke();
    emit(DistrictsListSuccess(districts.payload));
  }
  catch (e) {
    emit(DistrictsListError(e.toString()));
    print("in the catch");
  }
}}


sealed class DistrictsListState {}

class DistrictsListSuccess extends DistrictsListState {

 List<DistrictData>? DistrictsList;

  DistrictsListSuccess(this.DistrictsList);

}

class DistrictsListLoading extends DistrictsListState {
  String message;

  DistrictsListLoading(this.message);
}

class DistrictsListError extends DistrictsListState {
  String message;

  DistrictsListError(this.message);
}