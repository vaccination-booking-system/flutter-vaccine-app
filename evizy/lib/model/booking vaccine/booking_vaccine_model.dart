class bookingVaccineModel {
  String? timestamp;
  String? message;
  Data? data;

  bookingVaccineModel({this.timestamp, this.message, this.data});

  bookingVaccineModel.fromJson(Map<String, dynamic> json) {
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
  RegisteredBy? registeredBy;
  RegisteredBy? vaccinationSession;
  RegisteredBy? vaccine;
  String? nik;
  String? name;
  String? dateOfBirth;
  String? phoneNumber;
  String? gender;
  String? ageCategory;
  bool? isPregnant;
  String? idAddress;
  String? idUrbanVillage;
  String? idSubDistrict;
  String? idCity;
  String? idProvince;
  String? currAddress;
  String? currUrbanVillage;
  String? currSubDistrict;
  String? currCity;
  String? currProvince;

  Data(
      {this.id,
      this.registeredBy,
      this.vaccinationSession,
      this.vaccine,
      this.nik,
      this.name,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.ageCategory,
      this.isPregnant,
      this.idAddress,
      this.idUrbanVillage,
      this.idSubDistrict,
      this.idCity,
      this.idProvince,
      this.currAddress,
      this.currUrbanVillage,
      this.currSubDistrict,
      this.currCity,
      this.currProvince});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registeredBy = json['registered_by'] != null
        ? RegisteredBy.fromJson(json['registered_by'])
        : null;
    vaccinationSession = json['vaccination_session'] != null
        ? RegisteredBy.fromJson(json['vaccination_session'])
        : null;
    vaccine =
        json['vaccine'] != null ? RegisteredBy.fromJson(json['vaccine']) : null;
    nik = json['nik'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    ageCategory = json['age_category'];
    isPregnant = json['is_pregnant'];
    idAddress = json['id_address'];
    idUrbanVillage = json['id_urban_village'];
    idSubDistrict = json['id_sub_district'];
    idCity = json['id_city'];
    idProvince = json['id_province'];
    currAddress = json['curr_address'];
    currUrbanVillage = json['curr_urban_village'];
    currSubDistrict = json['curr_sub_district'];
    currCity = json['curr_city'];
    currProvince = json['curr_province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (registeredBy != null) {
      data['registered_by'] = registeredBy!.toJson();
    }
    if (vaccinationSession != null) {
      data['vaccination_session'] = vaccinationSession!.toJson();
    }
    if (vaccine != null) {
      data['vaccine'] = vaccine!.toJson();
    }
    data['nik'] = nik;
    data['name'] = name;
    data['date_of_birth'] = dateOfBirth;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['age_category'] = ageCategory;
    data['is_pregnant'] = isPregnant;
    data['id_address'] = idAddress;
    data['id_urban_village'] = idUrbanVillage;
    data['id_sub_district'] = idSubDistrict;
    data['id_city'] = idCity;
    data['id_province'] = idProvince;
    data['curr_address'] = currAddress;
    data['curr_urban_village'] = currUrbanVillage;
    data['curr_sub_district'] = currSubDistrict;
    data['curr_city'] = currCity;
    data['curr_province'] = currProvince;
    return data;
  }
}

class RegisteredBy {
  int? id;

  RegisteredBy({this.id});

  RegisteredBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
