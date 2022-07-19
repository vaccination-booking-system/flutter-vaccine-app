class TiketVaksineModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  TiketVaksineModel({this.timestamp, this.message, this.data});

  TiketVaksineModel.fromJson(Map<String, dynamic> json) {
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
  RegisteredBy? registeredBy;
  VaccinationSession? vaccinationSession;
  RegisteredBy? vaccine;
  String? nik;
  String? name;
  String? dateOfBirth;
  String? phoneNumber;
  String? gender;
  String? ageCategory;
  bool? isVaccinated;
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
  RegisteredBy? familyMember;

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
      this.isVaccinated,
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
      this.currProvince,
      this.familyMember});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registeredBy = json['registered_by'] != null
        ? RegisteredBy.fromJson(json['registered_by'])
        : null;
    vaccinationSession = json['vaccination_session'] != null
        ? VaccinationSession.fromJson(json['vaccination_session'])
        : null;
    vaccine =
        json['vaccine'] != null ? RegisteredBy.fromJson(json['vaccine']) : null;
    nik = json['nik'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    ageCategory = json['age_category'];
    isVaccinated = json['is_vaccinated'];
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
    familyMember = json['family_member'] != null
        ? RegisteredBy.fromJson(json['family_member'])
        : null;
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
    data['is_vaccinated'] = isVaccinated;
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
    if (familyMember != null) {
      data['family_member'] = familyMember!.toJson();
    }
    return data;
  }
}

class RegisteredBy {
  int? id;
  String? name;

  RegisteredBy({this.id, this.name});

  RegisteredBy.fromJson(Map<String, dynamic> json) {
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

class VaccinationSession {
  int? id;

  VaccinationSession({this.id});

  VaccinationSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
