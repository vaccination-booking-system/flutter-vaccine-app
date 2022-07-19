class KecamatanModel {
  String? id;
  String? regencyId;
  String? name;

  KecamatanModel({this.id, this.regencyId, this.name});

  KecamatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regencyId = json['regency_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['regency_id'] = regencyId;
    data['name'] = name;
    return data;
  }
}
