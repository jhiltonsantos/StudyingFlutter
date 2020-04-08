import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const request_covid = "https://covid19.mathdro.id/api";

Future<Map> getData() async {
  http.Response response = await http.get(request_covid);
  return json.decode(response.body);
}

const request_brazil = "https://covid19.mathdro.id/api/countries/brazil";

Future<Map> getDataBrazil() async {
  http.Response response = await http.get(request_brazil);
  return json.decode(response.body);
}