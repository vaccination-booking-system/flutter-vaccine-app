class KabupatenKotaModel {
  String? id;
  String? provinceId;
  String? name;

  KabupatenKotaModel({this.id, this.provinceId, this.name});

  KabupatenKotaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['province_id'] = provinceId;
    data['name'] = name;
    return data;
  }
}
