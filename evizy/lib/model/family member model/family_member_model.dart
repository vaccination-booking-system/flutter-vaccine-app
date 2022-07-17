class FamilyMemberModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  FamilyMemberModel({this.timestamp, this.message, this.data});

  FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  User? user;
  String? nik;
  String? name;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  String? relationship;

  Data(
      {this.id,
      this.user,
      this.nik,
      this.name,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.relationship});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    nik = json['nik'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['nik'] = nik;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['relationship'] = relationship;
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
