import 'dart:convert';
import "package:http/http.dart" as http;

class ApiServices {
  var Search;

  void getSearch({required String value}) {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$value&apiKey=1892de611537491eae15e337592e5723");
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Search = json.decode(response.body);
        print(Search);
      }
    });
  }
}
