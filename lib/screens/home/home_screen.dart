import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/model/product_details.dart';
import 'package:medicine_appp/model/user_details.dart';
import 'package:medicine_appp/provider/user_provider.dart';
import 'package:medicine_appp/screens/cart/cart_screen.dart';
import 'package:medicine_appp/screens/home/category_Screen.dart';
import 'package:medicine_appp/screens/home/product_list_page.dart';
import 'package:medicine_appp/screens/profile/user_profile_screen.dart';
import 'package:medicine_appp/service/api_service.dart';
import 'package:medicine_appp/utils/basic_container.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';
import 'package:medicine_appp/widgets/indicator_widget.dart';
import 'package:medicine_appp/widgets/product_widget.dart';
import 'package:provider/provider.dart';

final imageList = [
  "https://images.pexels.com/photos/208512/pexels-photo-208512.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/576831/pexels-photo-576831.jpeg?auto=compress&cs=tinysrgb&w=600"
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cCPage01 = 0;
  int cCPage02 = 0;
  ApiService apiService = ApiService();
  late UserData user;

  late Future<List<String>> _getBannerImages;
  late Future<List<ProductDetails>> _getproductList;

  @override
  void initState() {
    _getBannerImages = apiService.getBannerImages("header");
    _getproductList =
        apiService.getProductList([], apiService.getFinalUrlForProducts());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    user = Provider.of<UserProvider>(context).userInformation;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      // title: "Home Page",
      // showBack: false,
      showAppbar: false,
      topPadding: kToolbarHeight,
      floatButton: FloatingActionButton.extended(
        label: myText("Cart",
            style: theme.text16!.copyWith(color: theme.tCReverse)),
        backgroundColor: theme.companionColor02,
        icon: basicIcon(FontAwesomeIcons.cartShopping, color: theme.tCReverse),
        onPressed: () => navigateTo(context, const MyCartcreen()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.width * .2,
            child: Row(
              children: [
                basicSpace(width: 15),
                GestureDetector(
                  onTap: () => navigateTo(context, const UserProfileScreen()),
                  child: CircleAvatar(
                    radius: size.width * .06,
                    backgroundColor: theme.primaryColor,
                    child: basicIcon(FontAwesomeIcons.user,
                        color: theme.lightColor),
                  ),
                ),
                basicSpace(width: 8),
                myText("Hello,\n${user.firstName} ${user.lastName}")
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
                child: Column(
              children: [
                FutureBuilder(
                  future: _getBannerImages,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: circleLoader(),
                      );
                    }
                    return Column(
                      children: [
                        carouselWidget(size, .4, snapshot.data, 5 / 3,
                            (value) => setState(() => cCPage01 = value)),
                        IndicatorWidget(
                          currentCarouselPage: cCPage01,
                          totalLength: snapshot.data.length,
                        ),
                      ],
                    );
                  },
                ),
                BasicContainer(
                    child: Column(
                  children: [
                    myText("Offers & Coupons"),
                    carouselWidget(size, .1, imageList, 6 / 1.5,
                        (value) => setState(() => cCPage02 = value)),
                    IndicatorWidget(
                      currentCarouselPage: cCPage02,
                      totalLength: 3,
                    )
                  ],
                )),
                BasicContainer(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                navigateTo(context, const CategoryScreen()),
                            child: BasicContainer(
                                child: Row(
                              children: [
                                basicIcon(FontAwesomeIcons.tags),
                                myText("All Categories")
                              ],
                            )),
                          ),
                          GestureDetector(
                            onTap: () => navigateTo(
                                context,
                                const ProductListPage(
                                  title: "All Products",
                                )),
                            child: BasicContainer(
                                child: Row(
                              children: [
                                basicIcon(FontAwesomeIcons.bagShopping),
                                myText("All Products")
                              ],
                            )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => navigateTo(
                                context,
                                const ProductListPage(
                                  title: "My Favorite",
                                )),
                            child: BasicContainer(
                                child: Row(
                              children: [
                                basicIcon(FontAwesomeIcons.solidHeart),
                                myText("My Favorite")
                              ],
                            )),
                          ),
                          GestureDetector(
                            onTap: () => navigateTo(
                                context,
                                const ProductListPage(
                                  title: "New Arrival",
                                )),
                            child: BasicContainer(
                                child: Row(
                              children: [
                                basicIcon(FontAwesomeIcons.bagShopping),
                                myText("New Arrival")
                              ],
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                BasicContainer(
                    child: FutureBuilder(
                        future: _getproductList,
                        builder: (context, snap) {
                          if (snap.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: circleLoader(),
                            );
                          }
                          if (snap.data!.isEmpty) {
                            return myText("No Data");
                          }
                          return Column(
                            children: [
                              myText("Feature Products"),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      10,
                                      (index) => ProductWidget(
                                        product: snap.data![index],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        })),
                basicSpace(height: 100)
              ],
            )),
          ),
        ],
      ),
    );
  }
}
