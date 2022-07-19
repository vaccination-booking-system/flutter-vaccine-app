class KelurahanModel {
  String? id;
  String? districtId;
  String? name;

  KelurahanModel({this.id, this.districtId, this.name});

  KelurahanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['district_id'] = districtId;
    data['name'] = name;
    return data;
  }
}
