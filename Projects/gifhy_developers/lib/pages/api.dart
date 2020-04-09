import 'package:http/http.dart' as http;
import 'dart:convert';

const request_trending =
    "https://api.giphy.com/v1/gifs/trending?api_key=JS5DZKyuEx4mE0lYyVnDHbU949YjNGP7&limit=30&rating=R";

Future<Map> getGifs(String _search, int _offset) async {
  http.Response response;

  if (_search == null) {
    response = await http.get(request_trending);
  } else {
    response = await http.get(
        "https://api.giphy.com/v1/gifs/search?api_key=JS5DZKyuEx4mE0lYyVnDHbU949YjNGP7&q=$_search&limit=30&offset=$_offset&rating=G&lang=en");
  }

  return json.decode(response.body);
}
