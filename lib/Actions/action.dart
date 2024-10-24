import 'dart:async';
import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_application_1/appstate.dart';
import 'package:http/http.dart' as http;

class FetchItems extends ReduxAction<AppState> {
  final String url;
  FetchItems({required this.url});

  @override
  Future<AppState> reduce() async {
    try {
      //////state.fetchProducts;
      final response = await http.get(Uri.parse(url));

      ///print(response.body);

      final responseBody = jsonDecode(response.body);
      if (responseBody is List) {
        List<Product> fetchedProducts = (responseBody as List)
            .map((item) => Product.fromJson(item))
            .toList();
        return state.copy(fetchProducts: fetchedProducts);
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      print("Error occurred: $e");
      return state;
    }
  }
}
