import 'package:alisveris_app_homework2/data/repositories/data_address_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:intl/intl.dart';
import '../../../data/repositories/data_cart_repository.dart';
import '../../../domain/entities/cart.dart';
import '../../widgets/profile_button.dart';
import '../shopping_list_add/shopping_list_view.dart';
import '../user_address_add/user_address_view.dart';
import 'home_controller.dart';

class HomeViewCart extends View {
  @override
  State<StatefulWidget> createState() {
    return HomeViewCartState(
      HomeController(
        DataCartRepository(),
        DataAddressRepository(),
      ),
    );
  }
}

class HomeViewCartState extends ViewState<HomeViewCart, HomeController> {
  HomeViewCartState(HomeController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text(
          "Shopping App",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          ProfileButton(),
          SizedBox(
            width: size.width * 0.05,
          ),
        ],
      ),
      body: ControlledWidgetBuilder<HomeController>(
        builder: ((context, controller) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  child: Image.network(
                      "https://www.marketingturkiye.com.tr/wp-content/uploads/2018/01/shopping.jpg"),
                ),
                SizedBox(height: size.height * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCartView()));
                  },
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 238, 87),
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.04,
                            height: size.height * 0.09),
                        Icon(
                          Icons.shopping_cart,
                          size: size.height * 0.07,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(width: size.width * 0.04),
                        Text(
                          "Add Shopping List",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserAddressView(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 238, 87),
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.04,
                            height: size.height * 0.09),
                        Icon(
                          Icons.contact_mail,
                          size: size.height * 0.07,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(width: size.width * 0.04),
                        Text(
                          "Add User Address",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 238, 87),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.015),
                        child: controller.carts != null &&
                                controller.carts!.length != 0
                            ? Column(
                                children: [
                                  Text("Recently Added To The List",
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    controller.carts!.last.content,
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Recently Added To The List",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "List is empty",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 238, 87),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.015),
                        child: controller.address != null &&
                                controller.address!.length != 0
                            ? Column(
                                children: [
                                  Text("Last Address",
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    controller.address!.last.userAddress,
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Last Address",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "No Address Found",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class HomeViewFormattedCart extends StatelessWidget {
  Cart _cart;
  HomeViewFormattedCart(this._cart);

  @override
  Widget build(BuildContext context) {
    late DateTime _cartDate = DateTime.parse(_cart.date);
    return Column(
      children: [
        Text(
          _cart.content,
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 25,
          ),
        ),
        Text(DateFormat.yMMMMd().format(_cartDate).toString())
      ],
    );
  }
}
