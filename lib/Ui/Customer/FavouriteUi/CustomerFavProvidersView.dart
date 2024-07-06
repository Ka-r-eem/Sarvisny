import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Customer/FavouriteUi/FavProvidersScreen.dart';
import 'package:sarvisny/Ui/Customer/MyAccountUI/Profile.dart';
import '../../../di/di.dart';
import 'CustomerFavProvidersViewModel.dart';

class CustomerFavProvidersView extends StatefulWidget
{
  const CustomerFavProvidersView({super.key});

  @override
  State<CustomerFavProvidersView> createState() => _CustomerFavProvidersViewState();
}

class _CustomerFavProvidersViewState extends State<CustomerFavProvidersView> {

  var viewModel = getIt<CustomerFavProvidersViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetFavs(provider.UserId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return BlocConsumer<CustomerFavProvidersViewModel, CustomerFavProvidersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CustomerFavProvidersError) return false;
        if (current is CustomerFavProvidersLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CustomerFavProvidersError) return true;
        if (current is CustomerFavProvidersLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is CustomerFavProvidersLoading) {
          // showLoading;
        }
        if (state is CustomerFavProvidersError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is CustomerFavProvidersSuccess && provider.token != null && provider.token != "") {
          return FavProvidersScreen(favList: state.FavList);
        }
        else if (provider.token == null || provider.token == "") {
          return const Center(
            child: Text("Please Login"),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: LogoLoader(),
          ),
        );
      },
    );



    // FutureBuilder<CustomerProfileDataDto?>(
    //   future: ApiManager.GetCustomerProfile(provider.UserId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting ) {
    //       return const Center(child: LogoLoader());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     CustomerProfileDataDto? customerProfileData = snapshot.data;
    //     return MyAccount(details: customerProfileData?.payload,);
    //   },
    // );;
  }
}
