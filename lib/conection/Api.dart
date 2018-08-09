
import 'dart:async';
import 'dart:convert';
import 'package:flutter_mvp_example/domain/Repository.dart';
import 'package:http/http.dart' as http;

class Api{

  final urlBase = "http://rafaelbarbosatec.github.io/api/";

  Future <dynamic> get(uri) async{

    try{

      http.Response response = await http.get(urlBase+uri);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if(statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new FetchDataException("Error while getting data [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
      }

      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);

    } on Exception catch(e){
      throw new FetchDataException("Error while getting data [${e.toString()}]");
    }

  }

}