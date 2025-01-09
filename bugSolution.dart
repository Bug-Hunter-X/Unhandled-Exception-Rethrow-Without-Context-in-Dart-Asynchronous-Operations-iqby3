```dart
class NetworkException implements Exception {
  final String message;
  final String? url;
  final int? statusCode;

  NetworkException({required this.message, this.url, this.statusCode});

  @override
  String toString() {
    return 'NetworkException: $message, URL: $url, Status Code: $statusCode';
  }
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['someKey']);
    } else {
      throw NetworkException(
          message: 'Failed to load data',
          url: 'https://api.example.com/data',
          statusCode: response.statusCode);
    }
  } catch (e) {
    print('Error: $e'); // Now includes context from NetworkException
    rethrow; //Rethrowing allows higher level handling if needed.
  }
}
```