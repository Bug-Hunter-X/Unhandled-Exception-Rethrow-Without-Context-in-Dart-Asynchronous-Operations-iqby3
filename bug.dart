```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Use the data
      print(jsonData['someKey']);
    } else {
      // Handle the error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception
    print('Error: $e');
    // Rethrow the exception to be handled further up the call stack
    rethrow;
  }
}
```