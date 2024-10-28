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
      await Future.delayed(Duration(seconds: 3));
      final response = await http.get(Uri.parse(url));
      final responseBody = jsonDecode(response.body);
      if (responseBody is List) {
        List<Product> fetchedProducts = (responseBody as List)
            .map((item) => Product.fromJson(item))
            .toList();
        return state.copy(fetchProducts: fetchedProducts, isloading: false);
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      print("Error occurred: $e");
      return state;
    }
  }

  @override
  void before() {
    dispatch(SetLoadingAction(true));
  }

  @override
  void after() {
    dispatch(SetLoadingAction(false));
  }
}

class SetLoadingAction extends ReduxAction<AppState> {
  final bool isloading;
  SetLoadingAction(this.isloading);
  @override
  AppState reduce() {
    return state.copy(isloading: isloading);
  }
}
