import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriaData.dart';

/// criteriaName : "string"
/// description : "string"

class CriteriaDataDto {
  CriteriaDataDto({
      this.criteriaName, 
      this.description,});

  CriteriaDataDto.fromJson(dynamic json) {
    criteriaName = json['criteriaName'];
    description = json['description'];
  }
  String? criteriaName;
  String? description;
CriteriaDataDto copyWith({  String? criteriaName,
  String? description,
}) => CriteriaDataDto(  criteriaName: criteriaName ?? this.criteriaName,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['criteriaName'] = criteriaName;
    map['description'] = description;
    return map;
  }

  CriteriaData toCriteria(){
    return CriteriaData(
      description: description ,
      criteriaName: criteriaName
    );
  }


}