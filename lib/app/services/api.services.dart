import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

final ApiServices api = ApiServices();

class ApiServices {
  String baseurl = 'https://fakestoreapi.com';

  Future<dynamic> getHttp(String path) async {
    var url = Uri.parse(baseurl+path);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    
    var response = await http.get(url, headers: headers);
    if(response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      log('Error found in API');
    }
  }
}