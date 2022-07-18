import 'dart:convert';

import 'package:bloc_concepts/Covid/Network/Apis.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import '../Model/CovidModel.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = summary;

  Future<CovidModel> fetchCovidList() async {



    try {
      Response response = await _dio.get(_url,
//  queryParameters: {"phone":phone,"password":password}
      );
     // _dio.options.headers["authorization"]=


      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}