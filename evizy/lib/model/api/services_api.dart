import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:evizy/model/citizen/login_model.dart';
import 'package:evizy/model/citizen/register_model.dart';

class ServiceApi {
  final baseUrl = 'http://50.19.175.143/api/v1';
  final Dio dio = Dio();

  ServiceApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      e.response!.statusCode;
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
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
    } catch (e) {
      throw e;
    }
  }

  Future<RegisterModel> postRegister(
      String name, String nik, String phoneNumber, String password) async {
    try {
      final url = '$baseUrl/auth/register';
      final response = await dio.post(url, data: {
        "name": name,
        "nik": nik,
        "phoneNumber": phoneNumber,
        "password": password,
      });
      final data = response.data;
      return RegisterModel.fromJson(data);
    } catch (e) {
      throw e;
    }
  }
}
