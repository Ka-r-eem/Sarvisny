import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Ui/Customer/CartUi/MyCartView.dart';
import 'package:sarvisny/Ui/Customer/CriteriaUi/CustomerCriteriaListView.dart';
import 'package:sarvisny/Ui/Customer/FavouriteUi/FavScreen.dart';
import 'package:sarvisny/Ui/Customer/OrdersUi/OrderListView.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetCartUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import '../../Provider/ColorProvider.dart';
import '../../Provider/Provider.dart';
import '../../di/di.dart';
import 'MyAccountUI/CustomerProfileView.dart';

class CustomerHomeScreen extends StatefulWidget {
  static const String routeName = "CustomerHome";

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int currentIndex = 0;
  late ColorProvider colorProvider;
  late AppProvider appProvider;
  Future<int>? cartItemsNumFuture;

  @override
  void initState() {
    super.initState();
    colorProvider = ColorProvider();
    appProvider = AppProvider();
    colorProvider.loadSettingConfig();
    cartItemsNumFuture = getCartNumber();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Consumer<ColorProvider>(
          builder: (context, colorProvider, _) => IconButton(
            onPressed: () {
              colorProvider.changeTheme();
            },
            icon: colorProvider.isDarkEnabled()
                ? const Icon(Icons.sunny)
                : const Icon(Icons.dark_mode),
          ),
        ),
        actions: [
          FutureBuilder<int>(
            future: cartItemsNumFuture,
            builder: (context, snapshot) {
              int cartItemsNum = snapshot.data ?? 0;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Consumer<AppProvider>(
                  builder: (context, appProvider, _) {
                    return Badge(
                      largeSize: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      textStyle: const TextStyle(fontSize: 15, fontFamily: '2'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Text(cartItemsNum.toString()),
                      child: IconButton(
                        onPressed: () {
                          if (provider.token == null || provider.token == "") {
                            dialoguUtilities.showmsg(
                                context, "Please Login First",
                                postAction: Navigator.of(context).pop, pos: "Ok");
                          } else {
                            Navigator.pushNamed(context, MyCart.routeName);
                          }
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    );
                  },
                ),
              );
            },
          ),

        ],
        title: Consumer<ColorProvider>(
          builder: (context, colorProvider, _) => Image.asset(
            colorProvider.isDarkEnabled()
                ? "assets/images/LogoNoContainerDark.png"
                : "assets/images/LogoNoContainerLight.png",
            height: 30,
          ),
        ),
        shape: UnderlineInputBorder(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 5,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GNav(
            curve: Curves.easeInOut,
            color: Colors.white,
            tabBackgroundColor: Colors.white,
            activeColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(16),
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedIndex: currentIndex,
            gap: 12,
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.construction_sharp, text: "Services" , textColor: Colors.green ,iconActiveColor: Colors.green),
              GButton(icon: Icons.favorite_outlined, text: "Favourites" ,textColor: Colors.red ,iconActiveColor: Colors.red),
              GButton(icon: Icons.list_alt_rounded, text: "Orders"  ,textColor: Colors.purple ,iconActiveColor: Colors.purple),
              GButton(icon: Icons.account_circle_sharp, text: "Account", textColor: Colors.blue ,iconActiveColor: Colors.blue),


            ],
          ),
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    CustomerCriteriaListView(),
    Fav(),
    OrdersListWidget(),
    CustomerProfileView(),
  ];

  Future<int> getCartNumber() async {
    AppProvider provider = Provider.of<AppProvider>(context, listen: false);
    GetCartUseCase getCartUseCase = getIt<GetCartUseCase>();
    GetCartResponse cart = await getCartUseCase.invoke(provider.UserId ?? '');
    print(cart.payload?.requestedServices?.length);
    return cart.payload?.requestedServices?.length ?? 0;
  }
}
