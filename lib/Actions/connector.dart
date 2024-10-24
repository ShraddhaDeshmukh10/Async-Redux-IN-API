import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Actions/action.dart';
import 'package:flutter_application_1/View/landing%20page.dart';
import 'package:flutter_application_1/appstate.dart';

class APIConnector extends StatelessWidget {
  const APIConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        vm: () => Factory(this),
        builder: (context, vm) => LandingPage(
              fetchProducts: vm.fetchProducts,
            ));
  }
}

class ViewModel extends Vm {
  final List fetchProducts;
  ViewModel({
    required this.fetchProducts,
  }) : super(equals: [fetchProducts]);
}

class Factory extends VmFactory<AppState, APIConnector, ViewModel> {
  Factory(APIConnector widget) : super(widget);

  // @override
  // ViewModel fromStore() => ViewModel(
  //       fetchProducts: state.fetchProducts,
  //       //fetchProducts: () => dispatch(FetchItems(url: state.url)),
  //     );

  @override
  ViewModel fromStore() {
    if (state.fetchProducts.isEmpty) {
      dispatch(FetchItems(url: state.url));
    }
    return ViewModel(fetchProducts: state.fetchProducts);
  }
}
