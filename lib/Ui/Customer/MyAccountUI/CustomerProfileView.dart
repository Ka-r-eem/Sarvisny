import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Customer/MyAccountUI/CustomerMyAccountScreen.dart';
import 'package:sarvisny/Ui/Customer/MyAccountUI/Profile.dart';
import '../../../di/di.dart';
import 'CustomerProfileViewModel.dart';

class CustomerProfileView extends StatefulWidget
{
  const CustomerProfileView({super.key});

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {

  var viewModel = getIt<CustomerProfileViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetProfile(provider.UserId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return BlocConsumer<CustomerProfileViewModel, CustomerProfileState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CustomerProfileError) return false;
        if (current is CustomerProfileLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CustomerProfileError) return true;
        if (current is CustomerProfileLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is CustomerProfileLoading) {
          // showLoading;
        }
        if (state is CustomerProfileError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is CustomerProfileSuccess && provider.token != null && provider.token != "") {
          return ProfilePage(details: state.profileData.payload);
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
