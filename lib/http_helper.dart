import 'package:http/http.dart' as http;
import 'product.dart';
import 'dart:convert';

// make it a request
Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Product.fromJson(jsonDecode(response.body));
    var json = jsonDecode(response.body);
    List data = json['data'];
    return data.map((e) => new Product.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Products');
  }
}
