import 'package:flutter/material.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';




class AppProvider extends ChangeNotifier {
  bool is_visible = true;
  String? token;
  String? UserId;
  int CartItems = 0;
  CriteriaObject? selectedCriteria;
  CustomerServiceItem? selectedService ;

  void changeVisability() {
    notifyListeners();
  }

//   void IncreaseCart(){
//     CartItems+=1;
//     notifyListeners();
// }
//   void DecreaseCart(){
//     if(CartItems > 0){
//     CartItems-=1;}
//     notifyListeners();
// }
//
//   void ResetCart(){
//     CartItems = 0;
//     notifyListeners();
// }

}
