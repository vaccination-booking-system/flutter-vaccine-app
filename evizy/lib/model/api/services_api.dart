import 'package:dio/dio.dart';
import 'package:evizy/model/booking%20vaccine/booking_vaccine_model.dart';
import 'package:evizy/model/citizen/login_model.dart';
import 'package:evizy/model/citizen/register_model.dart';
import 'package:evizy/model/city/city_model.dart';
import 'package:evizy/model/family%20member%20model/create_family_member_screen.dart';
import 'package:evizy/model/family%20member%20model/delete_family_member_model.dart';
import 'package:evizy/model/family%20member%20model/family_member_model.dart';
import 'package:evizy/model/hospital/hospital_by_id.dart';
import 'package:evizy/model/hospital/hospital_model.dart';
import 'package:evizy/model/tiket%20vaksin/tiket_vaksin_model.dart';
import 'package:evizy/model/user/user_model.dart';
import 'package:evizy/model/vaccine%20session/vaccination_session_by_id_mode.dart';
import 'package:evizy/model/vaccine%20session/vaccination_session_model.dart';
import 'package:evizy/model/wilayah%20indonesia/kabupaten_kota_model.dart';
import 'package:evizy/model/wilayah%20indonesia/kecamatan_model.dart';
import 'package:evizy/model/wilayah%20indonesia/kelurahan.dart';
import 'package:evizy/model/wilayah%20indonesia/provinsi_model.dart';
import 'package:evizy/utils/constant/preferences_key.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApi {
  final baseUrl = 'http://50.19.175.143/api/v1';
  final baseUrl2 = 'http://www.emsifa.com/api-wilayah-indonesia/api';
  final Dio dio = Dio();

  ServiceApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response!.statusCode == 401) {
        final pref = await SharedPreferences.getInstance();
        pref.remove(PreferencesKeys.token);
        Fluttertoast.showToast(msg: 'Token Expired');
      } else if (e.response!.statusCode == 403) {
        final pref = await SharedPreferences.getInstance();
        pref.remove(PreferencesKeys.token);
        Fluttertoast.showToast(msg: 'Token Expired');
      }
      return handler.next(e);
    }));
  }

  Future<LoginModel> postLogin(String nik, String password) async {
    try {
      final url = '$baseUrl/auth/login';
      final response = await dio.post(url, data: {
        "nik": nik,
        "password": password,
      });
      final data = response.data;
      return LoginModel.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return LoginModel.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<RegisterModel> postRegister(
      String name, String nik, String phoneNumber, String password) async {
    try {
      final url = '$baseUrl/auth/register';
      final response = await dio.post(url, data: {
        "name": name,
        "nik": nik,
        "phone_number": phoneNumber,
        "password": password,
      });
      final data = response.data;
      return RegisterModel.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return RegisterModel.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<UserModel> getUser(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/users/$id';
      final response = await dio.get(url);

      final data = response.data;
      return UserModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<CreateFamilyMember> createFamilyMember(
      String name,
      String nik,
      String phoneNumber,
      String dateOfBirth,
      String gender,
      String relationship) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});

      final url = '$baseUrl/family-members';
      final response = await dio.post(url, data: {
        "name": name,
        "nik": nik,
        "phone_number": phoneNumber,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "relationship": relationship,
      });

      final data = response.data;
      return CreateFamilyMember.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return CreateFamilyMember.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<FamilyMemberModel> getFamilyMember(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/family-members?user_id=$id';
      final response = await dio.get(url);

      final data = response.data;
      return FamilyMemberModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<FamilyMemberModel> getFamilyMemberById(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/family-members/$id';
      final response = await dio.get(url);

      final data = response.data;
      return FamilyMemberModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<CreateFamilyMember> updateFamilyMember(
      int id,
      String name,
      String nik,
      String phoneNumber,
      String dateOfBirth,
      String gender,
      String relationship) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});

      final url = '$baseUrl/family-members/$id';
      final response = await dio.put(url, data: {
        "name": name,
        "nik": nik,
        "phone_number": phoneNumber,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "relationship": relationship,
      });

      final data = response.data;
      return CreateFamilyMember.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return CreateFamilyMember.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<DeleteFamilyMember> deleteFamilyMember(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/family-members/$id';
      final response = await dio.delete(url);

      final data = response.data;
      return DeleteFamilyMember.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<CityModel> getCity() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/cities';
      final response = await dio.get(url);

      final data = response.data;
      return CityModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<HospitalModel> getHospital(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/health-facilities?city_id=$id';
      final response = await dio.get(url);

      final data = response.data;
      return HospitalModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<HospitalByIdModel> getHospitalById(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/vaccination-session/$id';
      final response = await dio.get(url);

      final data = response.data;
      return HospitalByIdModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<VaccinationSessionModel> getVaccineSession(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/vaccination-session?health_facility_id=$id';
      final response = await dio.get(url);

      final data = response.data;
      return VaccinationSessionModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<VaccinationSessionByIdModel> getVaccineSessionById(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/vaccination-session/$id';
      final response = await dio.get(url);

      final data = response.data;
      return VaccinationSessionByIdModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<List<ProvinsiModel>> getProvinsi() async {
    try {
      final url = '$baseUrl2/provinces.json';
      final response = await dio.get(url);

      final data = response.data as List;
      List<ProvinsiModel> dataList =
          data.map((m) => ProvinsiModel.fromJson(m)).toList();
      return dataList;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<List<KabupatenKotaModel>> getKabupatenKota(int id) async {
    try {
      final url = '$baseUrl2/regencies/$id.json';
      final response = await dio.get(url);

      final data = response.data as List;
      List<KabupatenKotaModel> dataList =
          data.map((m) => KabupatenKotaModel.fromJson(m)).toList();
      return dataList;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<List<KecamatanModel>> getKecamatan(int id) async {
    try {
      final url = '$baseUrl2/districts/$id.json';
      final response = await dio.get(url);

      final data = response.data as List;
      List<KecamatanModel> dataList =
          data.map((m) => KecamatanModel.fromJson(m)).toList();
      return dataList;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<List<KelurahanModel>> getKelurahan(int id) async {
    try {
      final url = '$baseUrl2/villages/$id.json';
      final response = await dio.get(url);

      final data = response.data as List;
      List<KelurahanModel> dataList =
          data.map((m) => KelurahanModel.fromJson(m)).toList();
      return dataList;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }

  Future<BookingVaccineModel> bookingVaccine(
    int id,
    String kategori,
    bool statusHamil,
    String jalan,
    String kelurahan,
    String kecamatan,
    String kabupaten,
    String provinsi,
    String jalanKtp,
    String kelurahanKtp,
    String kecamatanKtp,
    String kabupatenKtp,
    String provinsiKtp,
  ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});

      final url = '$baseUrl/vaccination-pass';
      final response = await dio.post(url, data: {
        "vaccination_session": {"id": id},
        "age_category": kategori,
        "is_pregnant": statusHamil,
        "id_address": jalan,
        "id_urban_village": kelurahan,
        "id_sub_district": kecamatan,
        "id_city": kabupaten,
        "id_province": provinsi,
        "curr_address": jalanKtp,
        "curr_urban_village": kelurahanKtp,
        "curr_sub_district": kecamatanKtp,
        "curr_city": kabupatenKtp,
        "curr_province": provinsiKtp,
      });

      final data = response.data;
      return BookingVaccineModel.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return BookingVaccineModel.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<TiketVaksineModel> getTiketVaksin(int id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.get(PreferencesKeys.token).toString();
      dio.options.headers["authorization"] = "Bearer $token";

      final url = '$baseUrl/vaccination-pass?user_id=$id';
      final response = await dio.get(url);

      final data = response.data;
      return TiketVaksineModel.fromJson(data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      rethrow;
    }
  }
}
