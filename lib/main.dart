import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/connector.dart';
import 'package:flutter_application_1/appstate.dart';

void main() {
  var initialstate = AppState.initialState();
  Store<AppState> store = Store<AppState>(initialState: initialstate);
  runApp(StoreProvider(store: store, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: APIConnector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
