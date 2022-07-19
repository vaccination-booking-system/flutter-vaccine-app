import 'package:evizy/model/api/services_api.dart';
import 'package:evizy/model/booking%20vaccine/booking_vaccine_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingVaccineViewModel with ChangeNotifier {
  BookingVaccineModel _bookingVaccine = BookingVaccineModel();
  BookingVaccineModel get bookingVaccine => _bookingVaccine;
  final ServiceApi serviceApi = ServiceApi();

  Future createBookingVaccine(
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
      final data = await serviceApi.bookingVaccine(
          id,
          kategori,
          statusHamil,
          jalan,
          kelurahan,
          kecamatan,
          kabupaten,
          provinsi,
          jalanKtp,
          kelurahanKtp,
          kecamatanKtp,
          kabupatenKtp,
          provinsiKtp);
      if (data.message == "SUCCESS") {
        _bookingVaccine = data;
        notifyListeners();
        return true;
      } else if (data.message == "STOCK_EMPT") {
        Fluttertoast.showToast(msg: 'Tempat Faskes Sudah Penuh');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Ups, Something Went Wrong!');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Please Try Again Later');
      return false;
      // print(e);
    }
  }
}
