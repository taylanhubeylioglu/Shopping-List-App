import 'package:alisveris_app_homework2/app/pages/cart/cart_controller.dart';
import 'package:alisveris_app_homework2/data/repositories/data_cart_repository.dart';
import 'package:alisveris_app_homework2/domain/entities/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

class CartView extends View {
  @override
  State<StatefulWidget> createState() {
    return _CartViewState(
      CartController(
        DataCartRepository(),
      ),
    );
  }
}

class _CartViewState extends ViewState<CartView, CartController> {
  _CartViewState(CartController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "My Shopping List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: ControlledWidgetBuilder<CartController>(
        builder: ((context, controller) {
          return controller.carts != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      for (int i = 0; i < controller.carts!.length; i++)
                        controller.carts![i].userId == "1"
                            ? Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.02),
                                child: _FormattedCart(controller.carts![i]),
                              )
                            : Container(
                                child: Text(
                                  "Boş",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                  ),
                                ),
                              )
                    ],
                  ),
                )
              : Container();
        }),
      ),
    );
  }
}

class _FormattedCart extends StatelessWidget {
  Cart _cart;
  _FormattedCart(this._cart);

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
