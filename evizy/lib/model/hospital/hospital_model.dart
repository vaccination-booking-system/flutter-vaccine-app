class HospitalModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  HospitalModel({this.timestamp, this.message, this.data});

  HospitalModel.fromJson(Map<String, dynamic> json) {
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
  HealthFacility? healthFacility;
  HealthFacility? vaccine;
  String? scheduleDate;
  String? scheduleTimeStart;
  String? scheduleTimeEnd;
  int? quantity;
  int? booked;

  Data(
      {this.id,
      this.healthFacility,
      this.vaccine,
      this.scheduleDate,
      this.scheduleTimeStart,
      this.scheduleTimeEnd,
      this.quantity,
      this.booked});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    healthFacility = json['health_facility'] != null
        ? HealthFacility.fromJson(json['health_facility'])
        : null;
    vaccine = json['vaccine'] != null
        ? HealthFacility.fromJson(json['vaccine'])
        : null;
    scheduleDate = json['schedule_date'];
    scheduleTimeStart = json['schedule_time_start'];
    scheduleTimeEnd = json['schedule_time_end'];
    quantity = json['quantity'];
    booked = json['booked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (healthFacility != null) {
      data['health_facility'] = healthFacility!.toJson();
    }
    if (vaccine != null) {
      data['vaccine'] = vaccine!.toJson();
    }
    data['schedule_date'] = scheduleDate;
    data['schedule_time_start'] = scheduleTimeStart;
    data['schedule_time_end'] = scheduleTimeEnd;
    data['quantity'] = quantity;
    data['booked'] = booked;
    return data;
  }
}

class HealthFacility {
  int? id;
  String? name;

  HealthFacility({this.id, this.name});

  HealthFacility.fromJson(Map<String, dynamic> json) {
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
