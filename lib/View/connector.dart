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
              isloading: vm.isloading,
            ));
  }
}

class Factory extends VmFactory<AppState, APIConnector, ViewModel> {
  Factory(APIConnector widget) : super(widget);

// @override
// ViewModel fromStore() => ViewModel(
//       fetchProducts: state.fetchProducts,
//       fetchProducts: () => dispatch(FetchItems(url: state.url)),
//     );

  @override
  ViewModel fromStore() {
    if (state.fetchProducts.isEmpty && !state.isloading) {
      dispatch(FetchItems(url: state.url));
    }
    return ViewModel(
      fetchProducts: state.fetchProducts,
      isloading: state.isloading,
    );
  }
}

class ViewModel extends Vm {
  final List fetchProducts;
  final bool isloading;

  ViewModel({
    required this.fetchProducts,
    required this.isloading,
  }) : super(equals: [fetchProducts, isloading]);
}
