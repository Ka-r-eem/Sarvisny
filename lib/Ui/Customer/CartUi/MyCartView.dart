import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../di/di.dart';
import 'CartListScreen.dart';
import 'MyCartViewModel.dart';

class MyCart extends StatefulWidget {
  static const String routeName = "MyCart";

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var viewModel = getIt<MyCartViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetCartItems(provider.UserId);
    print("User ID : ${provider.UserId}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: BlocConsumer<MyCartViewModel, CartItemsState>(
        bloc: viewModel,
        buildWhen: (previous, current) => current is! CartItemsLoading,
        listenWhen: (previous, current) => current is CartItemsError || current is CartItemsLoading,
        listener: (context, state) {
          if (state is CartItemsLoading) {
            // Show loading indicator or similar action
          }
          if (state is CartItemsError) {
            print("Error : ${state.message}");
          }
        },
        builder: (context, state) {
          if (state is CartItemsSuccess) {
            print("Length : ${state.cart?.payload?.requestedServices?.length}");
            return CartListScreen(services: state.cart?.payload?.requestedServices);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
