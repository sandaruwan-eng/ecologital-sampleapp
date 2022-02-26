import 'package:http/http.dart' as http;

Future<String> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //Iterable dataBody = json.decode(response.body);
    return response.body;
  } else if (response.statusCode == 400) {
    throw Exception('Failed to load product list');
  } else {
    throw Exception('Network Error');
  }
}
