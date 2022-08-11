import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/data_cart_repository.dart';
import 'shopping_list_controller.dart';

class UserCartView extends View {
  @override
  State<StatefulWidget> createState() {
    return _UserCartViewState(
      ShoppingListController(
        DataCartRepository(),
      ),
    );
  }
}

class _UserCartViewState
    extends ViewState<UserCartView, ShoppingListController> {
  _UserCartViewState(ShoppingListController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "User Address Add",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ControlledWidgetBuilder<ShoppingListController>(
            builder: (context, controller) {
              return Column(
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.80,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        //obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) => {
                          controller.onContentTextFieldChanged(value),
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User Shopping List',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      controller.onAddUserCartButtonPressed();
                    },
                    child: Container(
                      width: size.width * 0.35,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Center(
                          child: Text(
                        "Save",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
