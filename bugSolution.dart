```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP request failed with status: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    print('JSON format error: $e');
    throw Exception('Invalid JSON response');
  } on Exception catch (e) {
    print('An error occurred: $e');
    rethrow; //Rethrow to allow handling at a higher level
  }
}

void main() async {
  try {
    final data = await fetchData();
    if(data != null) {
      print('Data fetched successfully: $data');
    }
  } on Exception catch (e) {
    print('An error occurred: $e');
  }
}
```