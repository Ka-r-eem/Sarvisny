/// criteriaName : "string"
/// description : "string"

class CriteriaData {
  CriteriaData({
      this.criteriaName, 
      this.description,});

  CriteriaData.fromJson(dynamic json) {
    criteriaName = json['criteriaName'];
    description = json['description'];
  }
  String? criteriaName;
  String? description;
CriteriaData copyWith({  String? criteriaName,
  String? description,
}) => CriteriaData(  criteriaName: criteriaName ?? this.criteriaName,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['criteriaName'] = criteriaName;
    map['description'] = description;
    return map;
  }

}