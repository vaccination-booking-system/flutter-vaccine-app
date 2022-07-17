class UserModel {
  String? timestamp;
  String? message;
  Data? data;

  UserModel({this.timestamp, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nik;
  String? phoneNumber;
  String? name;
  String? gender;
  String? dateOfBirth;

  Data(
      {this.id,
      this.nik,
      this.phoneNumber,
      this.name,
      this.gender,
      this.dateOfBirth});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    phoneNumber = json['phone_number'];
    name = json['name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['phone_number'] = phoneNumber;
    data['name'] = name;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    return data;
  }
}
